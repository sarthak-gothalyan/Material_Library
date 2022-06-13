import { MaterialModel } from './materialModel'
import { MenuOption, MultipleMenuOption, DotMenuOption} from './menuOptions'

@Component
struct MaterialSelect {
    menu: MenuOption[]
    onSelect: (item: MenuOption) => void
	@State model: MaterialModel.Model = new MaterialModel.Model('')
	@State menuModel: MaterialModel.MenuModel = new MaterialModel.MenuModel()
	private selected: number = -1

    @Builder
	MenuItem(option: MenuOption, index: number) {
        Row() {
            Text(option.getValue())
				.fontSize(this.menuModel.getFontSize())
				.fontWeight(FontWeight.Bold)
				.maxLines(2)
				.textOverflow({overflow: TextOverflow.Ellipsis})
        }
            .height(this.menuModel.getHeight())
			.width(this.menuModel.getWidth())
			.alignItems(VerticalAlign.Center)
			.backgroundColor(this.selected == index ? this.model.getSelectedColor() : this.model.getUnselectedColor())
            .onClick(() => {
                this.model.setPlaceholder(option.getValue())
				this.selected = index
                this.onSelect(option)
            })
			.padding(this.menuModel.getPadding())
    }

    @Builder
	MenuBuilder() {
        Column() {
			List() {
				ForEach(this.menu, (item, i) => {
					ListItem() {
						this.MenuItem(item, i)
					}
				}, item => item.id)
			}
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
            Flex({direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center}) {
                Text(this.model.getPlaceholder())
                    .fontSize(this.model.getFontSize())
                    .fontWeight(FontWeight.Bold)
                    .fontColor(this.model.getFontColor())
					.maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                Image($r('app.media.dropdown'))
                    .height(8)
                    .width(16)
                    .objectFit(ImageFit.Contain)
                    .opacity(0.5)
            }
                .width(this.model.getWidth())
                .height(this.model.getHeight())
				.padding(this.model.getPadding())
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

@Component
struct MultipleSelect {
    @State menu: MultipleMenuOption[] = []
    private selected: MultipleMenuOption[] = []
	onSelect: (itemList: MultipleMenuOption[]) => void
	@State model: MaterialModel.Model = new MaterialModel.Model('')
	@State menuModel: MaterialModel.MultipleMenuModel = new MaterialModel.MultipleMenuModel()

	private updateMenu() {
		let list = []
		let choices = []
		for (let i = 0; i < this.menu.length; i++) {
			let m = this.menu[i]
			list.push(m)
			if(m.getIsChecked()) {
				choices.push(m)
			}
		}
		this.menu = list
		this.selected = choices
		this.onSelect(this.selected)
	}

    aboutToAppear() {
        let choices = []
        for (let i = 0; i < this.menu.length; i++) {
            let m = this.menu[i]
            if(m.getIsChecked()) {
                choices.push(m)
            }
        }
        this.selected = choices
        this.onSelect(this.selected)
    }

    @Builder
	MenuItem(option: MultipleMenuOption, index: number) {
        Row({space: 9}) {
            Checkbox({name: option.getValue(),  group: "check"})
                .select(option.getIsChecked())
                .selectedColor(this.menuModel.getCheckColor())
                .height(this.menuModel.getCheckBoxHeight())
                .width(this.menuModel.getCheckBoxWidth())
				.onChange((val: boolean) => {
					this.menu[index].setIsChecked(Boolean(val))
					this.updateMenu()
				})
            Text(option.getValue())
                .fontSize(this.menuModel.getFontSize())
                .fontWeight(FontWeight.Bold)
				.maxLines(2)
                .textOverflow({overflow: TextOverflow.Ellipsis})
        }
            .width(this.menuModel.getWidth())
			.backgroundColor(this.menu[index].getIsChecked() ? this.model.getSelectedColor() : this.model.getUnselectedColor())
            .onClick(() => {
                this.menu[index].setIsChecked(!this.menu[index].getIsChecked())
				this.updateMenu()
            })
			.padding(this.menuModel.getPadding())
    }

    @Builder
	MenuBuilder() {
		Column() {
			List() {
				ForEach(this.menu, (item, i) => {
					ListItem() {
						this.MenuItem(item, i)
					}
				}, item => item.id)
			}
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
            Flex({justifyContent: FlexAlign.End, alignItems: ItemAlign.Center}) {
                Image($r('app.media.dropdown'))
                    .height(8)
                    .width(16)
                    .objectFit(ImageFit.Contain)
                    .opacity(0.5)
            }
                .height(this.model.getHeight())
				.width(this.model.getWidth())
                .borderWidth(this.model.getBorderWidth())
                .borderColor(this.model.getBorderColor())
                .borderRadius(this.model.getBorderRadius())
                .backgroundColor(this.model.getBackgroundColor())
                .bindMenu(this.MenuBuilder())
				.padding(this.model.getPadding())
        }
            .alignItems(HorizontalAlign.Start)
			.margin(this.model.getMargin())
    }
}

@Component
struct MaterialDotMenu {
	menu: DotMenuOption[] = []
	onSelect: (it: DotMenuOption) => void
	@State model: MaterialModel.DotModel = new MaterialModel.DotModel()
    @State menuModel: MaterialModel.DotMenuModel = new MaterialModel.DotMenuModel()

    @Builder
	MenuItem(option: DotMenuOption) {
        Row({space: 12}) {
            Image(option.getIcon())
                .objectFit(ImageFit.Contain)
                .width(this.menuModel.getIconWidth())
                .height(this.menuModel.getIconHeight())
            Text(option.getValue())
                .fontSize(this.menuModel.getFontSize())
				.fontColor(this.menuModel.getFontColor())
                .fontWeight(FontWeight.Bold)
        }
            .height(this.menuModel.getHeight())
            .width(this.menuModel.getWidth())
            .onClick(() => {
				this.onSelect(option)
            })
			.padding(this.menuModel.getPadding())
    }

    @Builder
	MenuBuilder() {
        Column() {
			List() {
				ForEach(this.menu, (item) => {
					ListItem() {
						this.MenuItem(item)
					}
				}, item => item.id)
			}
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

export { MaterialSelect, MultipleSelect, MaterialDotMenu }
export { MaterialModel, MenuOption, MultipleMenuOption, DotMenuOption }