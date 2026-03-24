// shell.qml
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
  //glued to top and sides
  anchors.top: true
  anchors.left: true
  anchors.right: true
  //
  implicitHeight: 30
  
  color:"#4D000000"

    RowLayout {
      
      anchors.fill: parent
      anchors.margins: 8

      Repeater {
        model: 5

        Rectangle{
          anchors.top: true
         
          Text {
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
          
            text: index + 1
          
            color: isActive ? "#a61b11" : (ws ? "#99FFFFFF" : "#1AFFFFFF")
            font { pixelSize:20; bold: true }

            MouseArea {
              onClicked: Hyprland.dispatch("workspace " + (index + 1))
            }
          }
        }
      }

      Item {Layout.fillWidth: true}
    }

}

