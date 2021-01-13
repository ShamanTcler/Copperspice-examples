#include <QtCore/QCoreApplication>
#include <QDebug>
#include <QString>
#include "myerror.h"

void test()
{
    qDebug() << "Starting";

    try
    {
        MyError *cErr = new MyError();
        cErr->SetMessage("lol");
        throw cErr;

        throw QString("The cat ate my homework!");


    }
    catch(char* cerr)
    {
        qDebug() << cerr;
    }
    catch(QString sErr)
    {
        qDebug() << "QSTRING = " << sErr;
    }
    catch(MyError *cErrMsg)
    {
        qDebug() << "MyError = " << cErrMsg->Message();
    }
    catch(...)
    {
        qDebug() << "Unknown Error has occured";
    }

    qDebug() << "Glag that's over with";
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    
    test();

    return a.exec();
}
