// change bind menu border radius
// change bind menu not scrollable
// fix any clipping issues

// import model namespace
import { MaterialModel } from './materialModel'

// ############################ single material select
export class MenuOption {
    value: string
    id: string | number
}

@Component
export struct MaterialSelect {
    // initialize selection
    menu: MenuOption[]
    onSelect: (item: MenuOption) => any
	@State model: MaterialModel.Model = new MaterialModel.Model('')
	@State menuModel: MaterialModel.MenuModel = new MaterialModel.MenuModel()
	private selected: number = -1

    // single menu item
    @Builder
	MenuItem(option: MenuOption, index: number) {
        Row() {
            Text(option.value)
				.fontSize(this.menuModel.getFontSize())
				.fontWeight(FontWeight.Bold)
				.maxLines(2)
				.textOverflow({overflow: TextOverflow.Ellipsis})
				.margin({left: 12, top: 15, bottom: 15})
        }
            .height(this.menuModel.getHeight())
			.width(this.menuModel.getWidth())
			.backgroundColor(this.selected == index ? this.model.getSelectedColor() : this.model.getUnselectedColor())
            .onClick(() => {
                this.model.setPlaceholder(option.value)
				this.selected = index
                this.onSelect(option)
            })
    }

    // complete menu
    @Builder
	MenuBuilder() {
        Column() {
            ForEach(this.menu, (item, i) => {
                this.MenuItem(item, i)
            })
        }
            .width(this.menuModel.getWidth())
            .padding({top: 7, bottom: 7})
            .borderRadius(this.menuModel.getBorderRadius())
    }

    build() {
        Column({space: 10}) {
            Text(this.model.getTitle())
                .fontSize(this.model.getTitleFontSize())
                .fontColor(this.model.getFontColor())
                .fontWeight(FontWeight.Medium)
            Row() {
                Text(this.model.getPlaceholder())
                    .fontSize(this.model.getFontSize())
                    .fontWeight(FontWeight.Bold)
                    .fontColor(this.model.getFontColor())
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
                .width(this.model.getWidth())
                .height(this.model.getHeight())
                .justifyContent(FlexAlign.SpaceBetween)
                .borderWidth(this.model.getBorderWidth())
                .borderColor(this.model.getBorderColor())
                .borderRadius(this.model.getBorderRadius())
                .backgroundColor(this.model.getBackgroundColor())
                .bindMenu(this.MenuBuilder())
        }
            .alignItems(HorizontalAlign.Start)
			.margin(this.model.getMargin())
    }
}

// ############################ multiple material select
export class MultipleMenuOption {
    value: string
    id: any
    isChecked?: boolean
}

@Component
export struct MultipleSelect {
    // stop the menu from disappearing on click

    @State menu: MultipleMenuOption[] = []
    private selected: MultipleMenuOption[] = []
	onSelect: (itemList: MultipleMenuOption[]) => any
	@State model: MaterialModel.Model = new MaterialModel.Model('')
	@State menuModel: MaterialModel.MultipleMenuModel = new MaterialModel.MultipleMenuModel()
	private updateMenu: () => void = () => {
		let list = []
		let choices = []
		for (let i = 0; i < this.menu.length; i++) {
			let m = this.menu[i]
			list.push(m)
			if(m.isChecked) {
				choices.push({value: m.value, id: m.id})
			}
		}
		this.menu = list
		this.selected = choices
		this.onSelect(this.selected)
	}

	// replace null values
    aboutToAppear() {
        let choices = []
        for (let i = 0; i < this.menu.length; i++) {
            let m = this.menu[i]
			if(m.isChecked == null) {
				m.isChecked = false
			}
            if(m.isChecked) {
                choices.push({value: m.value, id: m.id})
            }
        }
        this.selected = choices
        this.onSelect(this.selected)
    }

    // single menu item
    @Builder
	MenuItem(option: MultipleMenuOption, index: number) {
        Row({space: 9}) {
            Checkbox({name: option.value,  group: "check"})
                .select(option.isChecked)
                .selectedColor(this.menuModel.getCheckColor())
                .height(this.menuModel.getCheckBoxHeight())
                .width(this.menuModel.getCheckBoxWidth())
                .margin({left: 12})
				.onChange((val: boolean) => {
					this.menu[index].isChecked = Boolean(val)
					this.updateMenu()
				})
            Text(option.value)
                .fontSize(this.menuModel.getFontSize())
                .fontWeight(FontWeight.Bold)
				.maxLines(2)
                .textOverflow({overflow: TextOverflow.Ellipsis})
        }
            .width(this.menuModel.getWidth())
			.backgroundColor(this.menu[index].isChecked ? this.model.getSelectedColor() : this.model.getUnselectedColor())
            .onClick(() => {
                this.menu[index].isChecked = !this.menu[index].isChecked
				this.updateMenu()
            })
    }

    // complete menu
    @Builder
	MenuBuilder() {
		Column() {
			ForEach(this.menu, (item, i) => {
				this.MenuItem(item, i)
			})
		}
			.width(this.menuModel.getWidth())
			.padding({top: 7, bottom: 7})
			.borderRadius(this.menuModel.getBorderRadius())
    }

    build() {
        Column({space: 10}) {
            Text(this.model.getTitle())
                .fontSize(this.model.getTitleFontSize())
                .fontColor(this.model.getFontColor())
                .fontWeight(FontWeight.Medium)
            Row() {
                Image($r('app.media.dropdown'))
                    .height(8)
                    .width(16)
                    .objectFit(ImageFit.Contain)
                    .opacity(0.5)
                    .margin({ right: 10, top: 26, bottom: 26 })
            }
                .height(this.model.getHeight())
				.width(this.model.getWidth())
                .justifyContent(FlexAlign.End)
                .borderWidth(this.model.getBorderWidth())
                .borderColor(this.model.getBorderColor())
                .borderRadius(this.model.getBorderRadius())
                .backgroundColor(this.model.getBackgroundColor())
                .bindMenu(this.MenuBuilder())
        }
            .alignItems(HorizontalAlign.Start)
			.margin(this.model.getMargin())
    }
}

// ############################ dot material menu
export class DotMenuOption {
	icon?: string | Resource
	value: string
	id: number | string
}

@Component
export struct MaterialDotMenu {
	menu: DotMenuOption[] = []
	onSelect: (it: DotMenuOption) => any
	@State model: MaterialModel.DotModel = new MaterialModel.DotModel()
    @State menuModel: MaterialModel.DotMenuModel = new MaterialModel.DotMenuModel()

    // single menu item
    @Builder
	MenuItem(option: DotMenuOption) {
        Row({space: 12}) {
            Image(option.icon)
                .objectFit(ImageFit.Contain)
                .width(this.menuModel.getIconWidth())
                .height(this.menuModel.getIconHeight())
            Text(option.value)
                .fontSize(this.menuModel.getFontSize())
				.fontColor(this.menuModel.getFontColor())
                .fontWeight(FontWeight.Bold)
        }
            .height(this.menuModel.getHeight())
            .width(this.menuModel.getWidth())
            .onClick(() => {
				this.onSelect({value: option.value, id: option.id})
            })
    }

    // complete menu
    @Builder
	MenuBuilder() {
        Column() {
            ForEach(this.menu, (it) => {
				this.MenuItem(it)
			})
        }
            .width(this.menuModel.getWidth())
            .padding({top: 7, bottom: 7})
			.borderRadius(this.menuModel.getBorderRadius())
    }

    build() {
		Image($r('app.media.dot_menu'))
			.height(this.model.getHeight())
			.width(this.model.getWidth())
			.objectFit(ImageFit.Contain)
			.bindMenu(this.MenuBuilder())
			.margin(this.model.getMargin())
	}
}