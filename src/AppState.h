#ifndef APP_STATE_H
#define APP_STATE_H

#include <QObject>
#include <QStack>

class AppState : public QObject{
  Q_OBJECT
private:
  QStack<QString> _sectionTitles;
  QString popSectionTitle(void);
  static QString getCurrentTimeString(void);
  static QString getPrompt(void);

public:
  explicit AppState(QObject *parent = nullptr);

signals:
  void activeSectionTitleChanged(QString title);

public slots:
  bool healthCheck(void);
  void defaultButtonEcho(void);
  void defaultIconButtonEcho(void);
  void setActiveSectionTitle(QString title);
  void pushActiveSectionTitle(QString title);
  void popActiveSectionTitle(void);
};

#endif
