#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QIcon>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Example");
    app.setOrganizationDomain("example.com");
    app.setApplicationName("Frius");
    app.setApplicationVersion("0.0.1");

    qputenv("QSG_INFO", "1" );
    qputenv("QSG_RHI_BACKEND", "opengl");

    QQmlApplicationEngine engine;
    engine.addImportPath(":/");
    QQuickStyle::setStyle("Fusion");
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtApp", "Main");

    return app.exec();
}
