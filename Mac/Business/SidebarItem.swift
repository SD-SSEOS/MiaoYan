#if os(OSX)
import Cocoa
#else
import UIKit
#endif

class SidebarItem {
    var name: String
    var project: Project?
    var type: SidebarItemType
    public var icon: Image?

    init(name: String, project: Project? = nil, type: SidebarItemType, icon: Image? = nil) {
        self.name = name
        self.project = project
        self.type = type
        self.icon = icon
    }

    public func getName() -> String { name }

    public func isSelectable() -> Bool { true }

    public func isTrash() -> Bool { type == .Trash }

    public func isGroupItem() -> Bool {
        let notesLabel = NSLocalizedString("MiaoYan", comment: "Sidebar label")
        let trashLabel = NSLocalizedString("Trash", comment: "Sidebar label")
        if project == nil, [notesLabel, trashLabel].contains(name) {
            return true
        }
        return false
    }
}
