import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    id: mainWindow
       visible: true
       width: 600
       height: 400
       title: qsTr("Frameless Window!")

       // Window type is FramelessWindow.
       flags: Qt.FramelessWindowHint

       property point startPoint: Qt.point(0, 0)
       property point offsetPoint: Qt.point(0, 0)
       property bool  isMoveWindow: false

       Rectangle {
               id: titleBarRectangle
               x: 0
               y: 0
               width: parent.width
               height: 75
               color: "#3b4852"

               MouseArea {
                   id: mouseMoveWindowArea
                   anchors.fill: parent
                   onPressed: {
                       cursorShape =
                               Qt.DragMoveCursor;
                       startPoint = Qt.point(mouseX, mouseY);
                       isMoveWindow = true;
                   }
                   onPositionChanged: {
                       mainWindow.offsetPoint = Qt.point(mouseX - mainWindow.startPoint.x,
                                                        mouseY - mainWindow.startPoint.y);
                       if(true == mainWindow.isMoveWindow)
                       {
                           mainWindow.x = mainWindow.x +mainWindow.offsetPoint.x;
                           mainWindow.y = mainWindow.y +mainWindow.offsetPoint.y;
                       }

                   }
                   onReleased: {
                       cursorShape =
                               Qt.ArrowCursor;
                       isMoveWindow = false;
                   }

               }

               Loader {
                   id: closeButtonLoader
                   x: 570
                   y: 9
                   width: 0
                   height: 0
                   source: "/xqml/xbutton.qml"

                   onLoaded: {
                       item.buttonNormalImage = "/resources/buttonImage/close_normal.png";
                       item.buttonPressedImage = "/resources/buttonImage/close_down.png";
                       item.buttonHoverImage = "/resources/buttonImage/close_hover.png";
                       item.buttonDisableImage = "/resources/buttonImage/close_disable.png";
                       item.width = 23;
                       item.height = 18;

                   }

               }

               Loader {
                   id: miniSizeButtonLoader
                   x: 540
                   y: 8
                   width: 0
                   height: 0
                   source: "/xqml/xbutton.qml"

                   onLoaded: {
                       item.buttonNormalImage = "/resources/buttonImage/min_normal.png";
                       item.buttonPressedImage = "/resources/buttonImage/min_down.png";
                       item.buttonHoverImage = "/resources/buttonImage/min_hover.png";
                       item.buttonDisableImage = "/resources/buttonImage/min_disable.png";
                       item.width = 23;
                       item.height = 18;

                   }
               }

               Loader {
                   id: menuButtonLoader
                   x: 510
                   y: 9
                   width: 0
                   height: 0
                   source: "/xqml/xbutton.qml"

                   onLoaded: {
                       item.buttonNormalImage = "/resources/buttonImage/menu_normal.png";
                       item.buttonPressedImage = "/resources/buttonImage/menu_down.png";
                       item.buttonHoverImage = "/resources/buttonImage/menu_hover.png";
                       item.buttonDisableImage = "/resources/buttonImage/menu_disable.png";
                       item.width = 23;
                       item.height = 18;

                   }
               }

               Connections {
                   target: closeButtonLoader.item
                   onClicked: {
                       mainWindow.close();
                   }
               }

               Connections {
                   target: miniSizeButtonLoader.item
                   onClicked: {
                       mainWindow.showMinimized();
                   }
               }
       }
}
