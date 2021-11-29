#ifndef STRLIST_H
#define STRLIST_H

#include <QObject>
#include <QString>
#include <QStringList>

class StrList : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString list READ getText NOTIFY listChanged)
private:
    QStringList list;
public:
    StrList();
    Q_INVOKABLE void append(QString str);
    Q_INVOKABLE void removeLast();
    QString getText();
signals:
    void listChanged();
};

#endif // STRLIST_H
