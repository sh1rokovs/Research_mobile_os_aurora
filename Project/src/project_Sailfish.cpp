#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include "saperfield.h"

int main(int argc, char *argv[])
{
    QGuiApplication* app =  SailfishApp::application(argc, argv);
    qmlRegisterType<SaperField>("harbour.sapper.saperfield", 1, 0, "SaperField");
    QQuickView* view = SailfishApp::createView();
    view->setSource(SailfishApp::pathTo("qml/project_Sailfish.qml"));
    view->showFullScreen();
    QObject::connect(view->engine(), &QQmlEngine::quit, app, &QGuiApplication::quit);
    return app->exec();
}
