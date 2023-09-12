#pragma once

#include <vector>
#include <QObject>

class SinusTable : public QObject
{
    Q_OBJECT
public:
    SinusTable();
    ~SinusTable();

    double getY(double x) const;

private:
    std::vector<double> _table;
};
