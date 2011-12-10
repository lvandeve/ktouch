import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore

Item
{
    width: 102
    height: 102

    PlasmaCore.Svg {
        id: clockSvg
        imagePath: findImage("accuracymeter.svgz")
    }

    PlasmaCore.FrameSvgItem {
        anchors.fill: parent
        imagePath: findImage("meterbox.svgz")
        prefix: "analog"
    }

    PlasmaCore.SvgItem {
        anchors.centerIn: parent
        svg: clockSvg
        elementId: "background"
        width: naturalSize.width
        height: naturalSize.height
    }

    Text {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 20
        }
        text: "90"
        font.pixelSize: 10
    }

    Text {
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 20
        }
        text: "100"
        font.pixelSize: 10
    }

    PlasmaCore.SvgItem {
        id: hand
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 25
        svg: clockSvg
        elementId: "hand"
        width: naturalSize.width
        height: naturalSize.height
        smooth: true
        transform: Rotation {
            origin.x: hand.naturalSize.width / 2
            origin.y: hand.naturalSize.height / 2
            angle: Math.min(90, Math.max(0, stats.accuracy - 0.9) * 900)
            Behavior on angle {
                SpringAnimation { spring: 2; damping: 0.2; modulus: 360; mass: 0.75}
            }
        }
    }

}
