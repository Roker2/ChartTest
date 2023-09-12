#pragma once
#include <QAbstractSeries>
#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <sinustable.h>

#include <memory>

class LiveSinus : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int dotsCount READ getDotsCount WRITE setDotsCount NOTIFY dotsCountChanged)
    Q_PROPERTY(double min READ getMin NOTIFY minChanged)
    Q_PROPERTY(double max READ getMax NOTIFY maxChanged)
    QML_ELEMENT

    using SinusTablePtr = std::unique_ptr<SinusTable>;
public:
    LiveSinus();

    void setDotsCount(int dotsCount);
    int getDotsCount() const noexcept;

public slots:
    void moveRight();
    void update(QAbstractSeries *series);

signals:
    void dotsCountChanged();
    void minChanged();
    void maxChanged();
    void pointsAdded();

private:
    void generateFromMin();
    QPointF calculatePoint(double x) const;
    bool empty() const noexcept;
    void removePointsUnderMin();
    void addMaxPoint();
    void increaseMin();
    void increaseMax();

    double getMin() const noexcept;
    double getMax() const noexcept;

private slots:
    void regenerateFromMax();

private:
    int _dotsCount{ 100 };
    double _min{ 0.0 };
    double _max{ 0.0 };
    QList<QPointF> points;
    SinusTablePtr _sinusTable;
};
