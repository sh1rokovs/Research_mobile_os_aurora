#include "strlist.h"

StrList::StrList() : QObject() {
    this->list = QStringList();
}

void StrList::append(QString str) {
    this->list.append(str.toLower());
    emit listChanged();
}

void StrList::removeLast() {
    this->list.removeLast();
    emit listChanged();
}

QString StrList::getText() {
    QString text = this->list.join(", ");
    return text.replace(0, 1, text[0].toUpper());
}
