#ifndef APP_STATE_H
#define APP_STATE_H

#include <QObject>
#include <QStack>

class AppState : public QObject{
  Q_OBJECT
  Q_PROPERTY(qreal pageWidth READ pageWidth WRITE setPageWidth NOTIFY pageWidthChanged FINAL)
  Q_PROPERTY(qreal menuWidth READ menuWidth WRITE setMenuWidth NOTIFY menuWidthChanged FINAL)

private:
  QStack<QString> _sectionTitles;
  qreal _pageWidth;
  qreal _menuWidth;
  QString popSectionTitle(void);
  static QString getCurrentTimeString(void);
  static QString getPrompt(void);


public:
  explicit AppState(QObject *parent = nullptr);


signals:
  void activeSectionTitleChanged(QString title);
  void pageWidthChanged(qreal width);
  void menuWidthChanged(qreal width);


public slots:
  bool healthCheck(void);

  void defaultButtonEcho(void);
  void defaultIconButtonEcho(void);

  void setActiveSectionTitle(QString title);
  void pushActiveSectionTitle(QString title);
  void popActiveSectionTitle(void);

  void setPageWidth(qreal pageWidth);
  qreal pageWidth(void);

  void setMenuWidth(qreal menuWidth);
  qreal menuWidth(void);
};

#endif
