#ifndef APP_STATE_H
#define APP_STATE_H

#include <QObject>

class AppState : public QObject{
  Q_OBJECT
public:
  explicit AppState(QObject *parent = nullptr);

signals:

public slots:
  bool healthCheck(void);
  static QString getCurrentTimeString(void);
  void becho(void);
};

#endif
