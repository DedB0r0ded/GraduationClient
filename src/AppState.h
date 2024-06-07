#ifndef APP_STATE_H
#define APP_STATE_H

#include <QObject>
#include <QStack>

class AppState : public QObject{
  Q_OBJECT
private:
  QStack<QString> _sectionTitles;
  QString popSectionTitle(void);

public:
  explicit AppState(QObject *parent = nullptr);
  static QString getCurrentTimeString(void);

signals:
  void activeSectionTitleChanged(QString title);

public slots:
  bool healthCheck(void);
  void buttonEcho(void);
  void setActiveSectionTitle(QString title);
  void pushActiveSectionTitle(QString title);
  void popActiveSectionTitle(void);
};

#endif
