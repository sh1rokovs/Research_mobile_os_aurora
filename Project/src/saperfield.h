#ifndef SAPERFIELD_H
#define SAPERFIELD_H

#include <QtGui>
#include <QObject>
#include "time.h"


extern int CellSize;

class SaperField: public QObject{
protected:
    Q_OBJECT
    Q_PROPERTY(int size READ GetSize WRITE setSize)
    int size;
    unsigned char **arr;
public:
    SaperField();
    SaperField(int);
    Q_INVOKABLE void setSize(int);
    int GetSize();
    void ClearSquare(int, int);
    char OpenSquare(int, int);
    Q_INVOKABLE void setFlag(int, int);
    Q_INVOKABLE char openCell(int, int);
    char Win();
    Q_INVOKABLE char getCell(int, int);
    Q_INVOKABLE void randomFullfil(int, int, int bomb);
    unsigned char CountNeighbours(int, int);
    ~SaperField();
};

#endif // SAPERFIELD_H
