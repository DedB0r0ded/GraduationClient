#ifndef APP_STATE_H
#define APP_STATE_H

#include <QObject>

class AppState : public QObject{
  Q_OBJECT
private:
  QString _prevActiveSectionTitle;
  QString _activeSectionTitle;

public:
  explicit AppState(QObject *parent = nullptr);
  static QString getCurrentTimeString(void);

signals:
  void activeSectionTitleChanged(QString title);

public slots:
  bool healthCheck(void);
  void buttonEcho(void);
  void setActiveSectionTitle(QString title);
  QString previousActiveSectionTitle(void);
};

#endif
