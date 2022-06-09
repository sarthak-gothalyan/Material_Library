// import model class
import { MaterialModel } from './materialModel'

// ############################ single material select component
export class MenuOption {
    value: string
    id: string | number
}

@Component
export struct Select {
	// should menu item have height width or only font size

    // initialize selection
	name: string = 'Select'
    menu: MenuOption[]
    onSelect: (item: MenuOption) => void
	@State placeholder: string = 'Select'
	@State model: MaterialModel.Model = new MaterialModel.Model()
	@State menuModel: MaterialModel.MenuModel = new MaterialModel.MenuModel()
    width: number = 185
    height: number = 60
    fontSize: number = 18
    backgroundColor: ResourceColor | string = Color.White;
    borderColor: ResourceColor | string = '#d4d4d4';

    // single menu item
    @Builder MenuItem(option: MenuOption) {
        Row() {
            Text(option.value)
				.fontSize(this.menuModel.fontSize)
				.fontWeight(FontWeight.Bold)
				.maxLines(2)
				.textOverflow({overflow: TextOverflow.Ellipsis})
				.margin({left: 12, top: 15, bottom: 15})
        }
            .height(this.menuModel.height)
			.width(this.menuModel.width)
            .onClick(() => {
                this.placeholder = option.value
                this.onSelect(option)
            })
    }

    // the complete menu
    @Builder MenuBuilder() {
        Column() {
            ForEach(this.menu, (item) => {
                this.MenuItem(item)
            })
        }
            .width(this.menuModel.width)
            .padding({top: 7, bottom: 7})
            .borderRadius(this.menuModel.borderRadius)
    }

    build() {
        Column({space: 10}) {
            Text(this.name)
                .fontSize(14)
                .fontColor(this.model.fontColor)
                .fontWeight(FontWeight.Medium)
            Row() {
                Text(this.placeholder)
                    .fontSize(this.model.fontSize)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(this.model.fontColor)
					.maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .margin({ left: 16, top: 18, bottom: 18 })
                Image($r('app.media.dropdown'))
                    .height(8)
                    .width(16)
                    .objectFit(ImageFit.Contain)
                    .opacity(0.5)
                    .margin({ right: 10, top: 26, bottom: 26 })
            }
                .width(this.model.width)
                .height(this.model.height)
                .justifyContent(FlexAlign.SpaceBetween)
                .borderWidth(this.model.borderWidth)
                .borderColor(this.model.borderColor)
                .borderRadius(this.model.borderRadius)
                .backgroundColor(this.model.backgroundColor)
                .bindMenu(this.MenuBuilder())
        }
            .alignItems(HorizontalAlign.Start)
    }
}

// ############################ multiple material select component
export class MultipleMenuOption {
    value: string
    id: any
    is_checked: boolean
}

export class MultipleMenuSelection {
    value: string
    id: any
}

@Component
export struct MultipleSelect {
    // stop the menu from disappearing on click

	name: string = 'Multiple Select'
    @State menu: MultipleMenuOption[] = []
    private selected: MultipleMenuSelection[] = []
    select: (itemList: MultipleMenuSelection[]) => void
	@State model: MaterialModel.Model = new MaterialModel.Model()
	@State menuModel: MaterialModel.MultipleMenuModel = new MultipleMenuModel()

    aboutToAppear() {
        let choices = []
        for (let i = 0; i < this.menu.length; i++) {
            let m = this.menu[i]
            if(m.is_checked) {
                choices.push({value: m.value, id: m.id})
            }
        }
        this.selected = choices
        this.select(this.selected)
    }

    // single menu item
    @Builder MenuItem(option: MultipleMenuOption, index: number) {
        Row({space: 9}) {
            Checkbox({name: option.value,  group: "check"})
                .select(option.is_checked)
                .selectedColor(this.menuModel.selectedColor)
                .height(this.menuModel.checkBoxHeight)
                .width(this.menuModel.checkBoxWidth)
                .margin({left: 12})
            Text(option.value)
                .fontSize(this.menuModel.fontSize)
                .fontWeight(FontWeight.Bold)
				.maxLines(2)
                .textOverflow({overflow: TextOverflow.Ellipsis})
        }
            .width(this.menuModel.width)
            .onClick(() => {
                this.menu[index].is_checked = !this.menu[index].is_checked
                let list = []
                let choices = []
                for (let i = 0; i < this.menu.length; i++) {
                    let m = this.menu[i]
                    list.push(m)
                    if(m.is_checked) {
                        choices.push({value: m.value, id: m.id})
                    }
                }
                this.menu = list
                this.selected = choices
                this.select(this.selected)
            })
    }

    // complete menu
    @Builder MenuBuilder() {
    Column() {
        ForEach(this.menu, (item, i) => {
            this.MenuItem(item, i)
        })
    }
        .width(this.menuModel.width)
        .padding({top: 7, bottom: 7})
        .borderRadius(this.menuModel.borderRadius)
    }

    build() {
        Column({space: 10}) {
            Text(this.name)
                .fontSize(14)
                .fontColor(this.model.fontColor)
                .fontWeight(FontWeight.Medium)
            Row() {
                Image($r('app.media.dropdown'))
                    .height(8)
                    .width(16)
                    .objectFit(ImageFit.Contain)
                    .opacity(0.5)
                    .margin({ right: 10, top: 26, bottom: 26 })
            }
                .height(this.model.height)
				.width(this.model.width)
                .justifyContent(FlexAlign.End)
                .borderWidth(this.model.borderWidth)
                .borderColor(this.model.borderColor)
                .borderRadius(this.model.borderRadius)
                .backgroundColor(this.model.backgroundColor)
                .bindMenu(this.MenuBuilder())
        }
            .alignItems(HorizontalAlign.Start)
    }
}

// ############################ file material select component
class FileOption {
    value: string
    icon?: Resource | string
}

@Component
export struct DotMenu {
    width: number = 380
    height: number = 96
    fontSize: number = 18;
    placeholder: string = 'File'
    text: string = "lore ipsum"

    // single menu item
    @Builder MenuItem(option: FileOption, index: number) {
        Row({space: 12}) {
            Image(option.icon)
                .objectFit(ImageFit.Contain)
                .width(18)
                .height(18)
            Text(option.value)
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .height(21)
                .width(185 - (47 + 12))
        }
            .height(15 + 21 + 15)
            .width(185)
            .onClick(() => {
                console.log("" + index + ": " + option.value)
            })
    }

    // complete menu
    @Builder MenuBuilder() {
        Column() {
            this.MenuItem({value: "Preview", icon: $r('app.media.preview')}, 0)
            this.MenuItem({value: "Share", icon: $r('app.media.share')}, 1)
            this.MenuItem({value: "Get Link", icon: $r('app.media.get_link')}, 2)
            Divider().strokeWidth(1).color('#d4d4d4')
            this.MenuItem({value: "Remove", icon: $r('app.media.remove')}, 3)
            this.MenuItem({value: "Download", icon: $r('app.media.download')}, 4)
        }
            .width(185)
            .padding({top: 7, bottom: 7})
            .borderRadius(4)
    }

    build() {
        Column({space: 8}) {
            Row() {
                Text(this.placeholder)
                    .fontSize(this.fontSize)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#333F48')
                    .width(this.width - (16 + 279))
                    .height(this.height - (16 + 56))
                    .textOverflow({overflow: TextOverflow.Ellipsis})
                Image($r('app.media.dot_menu'))
                    .height(26)
                    .width(6)
                    .objectFit(ImageFit.Contain)
                    .opacity(0.5)
                    .bindMenu(this.MenuBuilder)
            }
                .width(this.width - (16+16))
                .height(26)
                .justifyContent(FlexAlign.SpaceBetween)
                .margin({top: 16})
            Text(this.text)
                .fontSize(14)
                .fontColor('#9CA2C7')
                .height(this.height - (48 + 12))
                .width(this.width - (16 + 56))
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .margin({left: 16, right: 56})
        }
            .width(this.width)
            .height(this.height)
            .justifyContent(FlexAlign.SpaceBetween)
            .borderWidth(1)
            .borderColor('#9CA2C7')
            .borderRadius(4)
    }
}