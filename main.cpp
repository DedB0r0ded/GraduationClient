#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Example");
    app.setOrganizationDomain("example.com");
    app.setApplicationName("Example");
    app.setApplicationVersion("0.0.2");

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
