#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include "counter.h"
#include "strlist.h"

int main(int argc, char *argv[])
{
    {
        const QMetaObject meta = Counter::staticMetaObject;
        QObject *obj = meta.newInstance();
        QObject::connect(obj, SIGNAL(countChanged()), obj, SLOT(print()));

        meta.invokeMethod(obj, "increment");
        meta.invokeMethod(obj, "increment");
        meta.invokeMethod(obj, "increment");

        meta.invokeMethod(obj, "reset");
    }

    qmlRegisterType<Counter>("custom.Counter", 1, 0, "Counter");
    qmlRegisterType<StrList>("custom.StrList", 1, 0, "StrList");

    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();
    view->setSource(SailfishApp::pathTo("qml/lab_8.qml"));
    view->showFullScreen();

    return app->exec();
}
