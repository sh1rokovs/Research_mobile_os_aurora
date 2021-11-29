#include "saperfield.h"

SaperField::SaperField(): QObject()
{
   size = 0;
   arr = 0;
}

SaperField::SaperField(int s): QObject()
{
    size = s;
    arr = new unsigned char*[size+2];
    for(int i = 0; i < size + 2; i++)
    {
        arr[i] = new unsigned char[size+2];
        for(int j = 0; j < size+2; j++)
        {
            arr[i][j] = 0x02;
        }
    }
}

void SaperField::setSize(int s)
{
    if(arr)
    {
        for(int i = 0; i < size+2; i++)
        {
            delete[]arr[i];
        }
        delete[] arr;
    }
    size = s;
    arr = new unsigned char*[size+2];
    for(int i = 0; i < size+2; i++)
    {
        arr[i] = new unsigned char[size+2];
        for(int j = 0; j < size+2; j++)
        {
            arr[i][j] = 0x02;
        }
    }
}

int SaperField::GetSize()
{
    return size;
}

void SaperField::ClearSquare(int l, int k)
{
    arr[l][k] = arr[l][k] & 0xFE;
    arr[l+1][k+1] = arr[l+1][k+1]&0xFE;
    arr[l+1][k] = arr[l+1][k]&0xFE;
    arr[l+1][k-1] = arr[l+1][k-1]&0xFE;
    arr[l][k-1] = arr[l][k-1]&0xFE;
    arr[l-1][k-1] = arr[l-1][k-1]&0xFE;
    arr[l-1][k] =  arr[l-1][k]&0xFE;
    arr[l-1][k+1] = arr[l-1][k+1]&0xFE;
    arr[l][k+1] = arr[l][k+1]&0xFE;
}

char SaperField::getCell(int l, int k)
{
    return arr[l][k];
}

char SaperField::OpenSquare(int l, int k)
{
    return openCell (l,k) |
    openCell(l+1,k+1) |
    openCell(l+1,k) |
    openCell(l+1,k-1) |
    openCell(l,k-1)  |
    openCell(l-1,k-1)|
    openCell(l-1,k) |
    openCell(l-1,k+1)|
    openCell(l,k+1);
}

char SaperField::openCell(int l, int k)
{
    if (!(arr[l][k] & 0x02)||(l*k==0)||(l==size+1)||(k==size+1)||(arr[l][k] & 0x04))
        return Win();
    arr[l][k]=arr[l][k] & 0xFD;
    if (arr[l][k]&0x01)
    {
        return 2;
    }
    else if(!(arr[l][k]>>4))
    {
        openCell(l+1,k+1);
        openCell(l+1,k);
        openCell(l+1,k-1);
        openCell(l,k-1);
        openCell(l-1,k-1);
        openCell(l-1,k);
        openCell(l-1,k+1);
        openCell(l,k+1);
    }
    return Win();
}

char SaperField::Win()
{
    char won  = 1;
    for(int i = 1; i < size+1; i++)
    {
        for(int j = 1; j < size+1; j++)
        {
            won  = won * (!(arr[i][j] & 0x02) + (arr[i][j]&0x01));
        }
    }
    return won;
}

void SaperField::setFlag(int l, int k)
{
    arr[l][k]=arr[l][k] ^ 0x04;
}

unsigned char SaperField::CountNeighbours(int a, int b)
{
    unsigned char count = 0;
    count+=arr[a+1][b+1]&0x01;
    count+=arr[a+1][b]&0x01;
    count+=arr[a+1][b-1]&0x01;
    count+=arr[a][b-1]&0x01;
    count+=arr[a-1][b-1]&0x01;
    count+=arr[a-1][b]&0x01;
    count+=arr[a-1][b+1]&0x01;
    count+=arr[a][b+1]&0x01;
    return count;
}


void SaperField::randomFullfil(int l, int k, int bomb)
{
    srand(time(NULL));
    for(int i = 1; i < size+1; i++)
    {
        for(int j = 1; j < size+1; j++)
        {
            arr[i][j] =  !(rand()%bomb);

        }
    }
    ClearSquare(l, k);
    for(int i = 1; i < size+1; i++)
    {
        for(int j = 1; j < size+1; j++)
        {
            if (! arr[i][j])
            {
                arr[i][j] = arr[i][j] | ((CountNeighbours(i,j))<<4);
            }
            arr[i][j] = arr[i][j]|0x02;
        }
    }
}

SaperField::~SaperField()
{
    if(arr)
    {
        for(int i = 0; i < size+2; i++)
        {
            delete[]arr[i];
        }
        delete[] arr;
    }
}
