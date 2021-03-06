import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ovras.advsettings 1.0
import "common"

MyStackViewPage {
    headerText: "Application Settings"

    content: ColumnLayout {
        spacing: 18

        MyToggleButton {
            id: settingsAutoStartToggle
            text: "Autostart"
            onCheckedChanged: {
                SettingsTabController.setAutoStartEnabled(checked, false)
            }
        }

        MyToggleButton {
            id: forceReviveToggle
            text: "Force Revive Page"
            onCheckedChanged: {
                SettingsTabController.setForceRevivePage(checked, true)
            }
        }

        MyToggleButton {
            id: allowExternalEditsToggle
            text: "Allow External App Chaperone Edits (Danger)"
            onCheckedChanged: {
                MoveCenterTabController.setAllowExternalEdits(checked, true)
            }
        }

        MyToggleButton {
            id: oldStyleMotionToggle
            text: "Old-Style Motion (per-frame disk writes)"
            onCheckedChanged: {
                MoveCenterTabController.setOldStyleMotion(checked, true)
            }
        }

        MyToggleButton {
            id: universeCenteredRotationToggle
            text: "Universe-Centered Rotation (Disables HMD Centering)"
            onCheckedChanged: {
                MoveCenterTabController.setUniverseCenteredRotation(checked, true)
            }
        }

        Item {
            Layout.fillHeight: true
        }

        Component.onCompleted: {
            settingsAutoStartToggle.checked = SettingsTabController.autoStartEnabled
            forceReviveToggle.checked = SettingsTabController.forceRevivePage
            allowExternalEditsToggle.checked = MoveCenterTabController.allowExternalEdits
            oldStyleMotionToggle.checked = MoveCenterTabController.oldStyleMotion
            universeCenteredRotationToggle.checked = MoveCenterTabController.universeCenteredRotation
        }

        Connections {
            target: SettingsTabController
            onAutoStartEnabledChanged: {
                settingsAutoStartToggle.checked = SettingsTabController.autoStartEnabled
            }
            onForceRevivePageChanged: {
                forceReviveToggle.checked = SettingsTabController.forceRevivePage
            }
        }

        Connections {
            target: MoveCenterTabController
            onAllowExternalEditsChanged: {
                allowExternalEditsToggle.checked = MoveCenterTabController.allowExternalEdits
            }
            onOldStyleMotionChanged: {
                oldStyleMotionToggle.checked = MoveCenterTabController.oldStyleMotion
            }
            onUniverseCenteredRotationChanged: {
                universeCenteredRotationToggle.checked = MoveCenterTabController.universeCenteredRotation
            }
        }
    }
}
