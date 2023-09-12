#include "sinustable.h"

#include <cmath>
#include <QDebug>

constexpr size_t tableSize = 3141 * 2; // 2pi
constexpr double precision = 1000.0;
constexpr auto pi2 = 2 * M_PI;

SinusTable::SinusTable()
{
    _table.reserve(tableSize);
    for(size_t i = 0; i < tableSize; i++)
    {
        _table.push_back(std::sin(i / precision));
    }
}

SinusTable::~SinusTable()
{
    _table.clear();
}

double SinusTable::getY(double x) const
{
    x = x - pi2 * std::floor(x / pi2);
    size_t index = static_cast<size_t>(x * precision) % tableSize;
    return _table.at(index);
}
