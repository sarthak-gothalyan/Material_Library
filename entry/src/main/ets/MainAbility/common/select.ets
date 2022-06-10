// import model class
import { MaterialModel } from './materialModel'

// ############################ single material select component
export class MenuOption {
    value: string
    id: string | number
}

@Component
export struct MaterialSelect {
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
    backgroundColor: ResourceColor | string = Color.White
    borderColor: ResourceColor | string = '#d4d4d4'

    // single menu item
    @Builder MenuItem(option: MenuOption, ind: number) {
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
	onSelect: (itemList: MultipleMenuSelection[]) => void
	@State model: MaterialModel.Model = new MaterialModel.Model()
	@State menuModel: MaterialModel.MultipleMenuModel = new MaterialModel.MultipleMenuModel()

    aboutToAppear() {
        let choices = []
        for (let i = 0; i < this.menu.length; i++) {
            let m = this.menu[i]
            if(m.is_checked) {
                choices.push({value: m.value, id: m.id})
            }
        }
        this.selected = choices
        this.onSelect(this.selected)
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
                this.onSelect(this.selected)
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
export class DotMenuOption {
	icon?: string | Resource
	value: string
	id: number | string
}

export class DotMenuSelection {
	value: string
	id: number | string
}

@Component
export struct MaterialDotMenu {
	menu: DotMenuOption[] = []
	height: number | string = 24
	width: number | string = 24
	onSelect: (it: DotMenuSelection) => any
	@State model: MaterialModel.DotModel = new MaterialModel.DotModel()
    @State menuModel: MaterialModel.DotMenuModel = new MaterialModel.DotMenuModel()

    // single menu item
    @Builder MenuItem(option: DotMenuOption) {
        Row({space: 12}) {
            Image(option.icon)
                .objectFit(ImageFit.Contain)
                .width(18)
                .height(18)
            Text(option.value)
                .fontSize(this.menuModel.fontSize)
				.fontColor(this.menuModel.fontColor)
                .fontWeight(FontWeight.Bold)
        }
            .height(this.menuModel.height)
            .width(this.menuModel.width)
            .onClick(() => {
				this.onSelect({value: option.value, id: option.id})
            })
    }

    // complete menu
    @Builder MenuBuilder() {
        Column() {
            ForEach(this.menu, (it) => {
				this.MenuItem(it)
			})
        }
            .width(this.menuModel.width)
            .padding({top: 7, bottom: 7})
			.borderRadius(this.menuModel.borderRadius)
    }

    build() {
		Image($r('app.media.dot_menu'))
			.height(this.model.height)
			.width(this.model.width)
			.borderColor(this.model.borderColor)
			.borderRadius(this.model.borderRadius)
			.borderWidth(this.model.borderWidth)
			.objectFit(ImageFit.Contain)
			.bindMenu(this.MenuBuilder())
	}
}