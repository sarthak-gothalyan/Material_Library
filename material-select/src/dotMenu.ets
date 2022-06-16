import { MenuProperties } from './properties'
import { DotMenuOption } from './menuOptions'

@Component
struct DotMenu {
	menu: DotMenuOption[] = []
	onSelect: (it: DotMenuOption) => void
	@State model: DotMenu.Model = new DotMenu.Model()
	@State menuModel: DotMenu.MenuModel = new DotMenu.MenuModel()

	@Builder
	MenuItem(option: DotMenuOption) {
		Row() {
			Image(option.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
				.margin({right: 12})
			Text(option.getValue())
				.fontSize(this.menuModel.getFontSize())
				.fontColor(this.menuModel.getFontColor())
				.flexGrow(1)
				.maxLines(2)
				.textOverflow({ overflow: TextOverflow.Ellipsis })
				.fontWeight(FontWeight.Bold)
		}
		.height(this.menuModel.getHeight())
		.width(this.menuModel.getWidth())
		.onClick(() => {
			if (this.onSelect != null && this.onSelect != undefined) this.onSelect(option)
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
		.padding({ top: 7, bottom: 7 })
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

namespace DotMenu {
	export class Model {
		private height: number | string = 24
		private width: number | string = 24
		private backgroundColor: string | Color = Color.White
		private margin: Margin | Length = 0

		setHeight(height: number | string): Model {
			if (height == null || height == undefined) {
				this.height = 24
				return this
			}
			this.height = height
			return this
		}

		getHeight(): number | string {
			return this.height
		}

		setWidth(width: number | string): Model {
			if (width == null || width == undefined) {
				this.width = 24
				return this
			}
			this.width = width
			return this
		}

		getWidth(): number | string {
			return this.width
		}

		setBackgroundColor(backgroundColor: string | Color): Model {
			if (backgroundColor == null || backgroundColor == undefined) {
				this.backgroundColor = Color.White
				return this
			}
			this.backgroundColor = backgroundColor
			return this
		}

		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setMargin(margin: Margin | Length): Model {
			if (margin == null || margin == undefined) {
				this.margin = 0
				return this
			}
			this.margin = margin
			return this
		}

		getMargin(): Margin | Length {
			return this.margin
		}
	}

	export class MenuModel extends MenuProperties {
		private iconHeight: number | string = 18
		private iconWidth: number | string = 18

		setIconHeight(iconHeight: number | string): MenuModel {
			if (iconHeight == null || iconHeight == undefined) {
				this.iconHeight = 18
				return this
			}
			this.iconHeight = iconHeight
			return this
		}

		getIconHeight(): number | string {
			return this.iconHeight
		}

		setIconWidth(iconWidth: number | string): MenuModel {
			if (iconWidth == null || iconWidth == undefined) {
				this.iconWidth = 18
				return this
			}
			this.iconWidth = iconWidth
			return this
		}

		getIconWidth(): number | string {
			return this.iconWidth
		}
	}
}

export { DotMenu, DotMenuOption }