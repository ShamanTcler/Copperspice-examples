#ifndef MYERROR_H
#define MYERROR_H

#include <QObject>
#include <QString>

class MyError : public QObject
{
    CS_OBJECT(MyError)
public:
    explicit MyError(QObject *parent = 0);
    
    QString Message();
    void SetMessage(QString Msg);

public:
    
public :
    
protected:
    QString mMessage;
};

#endif // MYERROR_H
