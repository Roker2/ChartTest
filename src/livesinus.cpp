#include "livesinus.h"

#include <QXYSeries>

constexpr double step{ 0.1 };

LiveSinus::LiveSinus()
    : _sinusTable(std::make_unique<SinusTable>())
{
    generateFromMin();

    connect(this, &LiveSinus::dotsCountChanged,
            this, &LiveSinus::regenerateFromMax);
}

void LiveSinus::setDotsCount(int dotsCount)
{
    if (dotsCount == _dotsCount)
        return;
    _dotsCount = dotsCount;
    emit dotsCountChanged();
}

int LiveSinus::getDotsCount() const noexcept
{
    return _dotsCount;
}

void LiveSinus::moveRight()
{
    increaseMin();
    increaseMax();
    removePointsUnderMin();
    addMaxPoint();
}

void LiveSinus::update(QAbstractSeries *series)
{
    if (series) {
        auto xySeries = static_cast<QXYSeries *>(series);
        xySeries->replace(points);
    }
}

void LiveSinus::generateFromMin()
{
    addMaxPoint();
    while (points.count() != _dotsCount)
    {
        increaseMax();
        addMaxPoint();
    }
}

QPointF LiveSinus::calculatePoint(double x) const
{
    return QPointF(static_cast<qreal>(x),
                   static_cast<qreal>(_sinusTable->getY(x)));
}

bool LiveSinus::empty() const noexcept
{
    return points.empty();
}

void LiveSinus::removePointsUnderMin()
{
    if (!empty())
    {
        while (points.first().x() < _min)
        {
            points.removeFirst();
        }
    }
}

void LiveSinus::addMaxPoint()
{
    if (!empty() && points.last().x() == _max)
        return;
    points.append(calculatePoint(_max));
    emit pointsAdded();
}

void LiveSinus::increaseMin()
{
    _min += step;
    emit minChanged();
}

void LiveSinus::increaseMax()
{
    _max += step;
    emit maxChanged();
}

double LiveSinus::getMin() const noexcept
{
    return _min;
}

double LiveSinus::getMax() const noexcept
{
    return _max;
}

void LiveSinus::regenerateFromMax()
{
    _min = _max - _dotsCount * step;
    _max = _min;
    emit minChanged();
    emit maxChanged();
    points.clear();
    generateFromMin();
}
