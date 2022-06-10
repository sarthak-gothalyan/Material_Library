// make functions to change properties
export namespace MaterialModel {
	export class Model {
		private title: string = ''
		private titleFontSize: number | string = 14
		private placeholder: string = 'Select'
		private height: number | string = 60
		private width: number | string = 100
		private fontSize: number | string = 18
		private fontColor: string | Color = '#333F48'
		private backgroundColor: string | Color = Color.White
		private borderWidth: number | string = 1
		private borderRadius: number | string = 4
		private borderColor: string | Color = '#9CA2C7'
		private unselectedColor: string | Color = Color.White
		private selectedColor: string | Color = '#F0F3FF'

		constructor(title: string, placeholder?: string) {
			this.title = title
			if(placeholder != null) this.placeholder = placeholder
		}

		getTitle(): string {
			return this.title
		}

		setPlaceholder(placeholder: string): Model {
			this.placeholder = placeholder
			return this
		}
		getPlaceholder(): string {
			return this.placeholder
		}

		setTitleFontSize(titleFontSize: number | string): Model {
			this.titleFontSize = titleFontSize
			return this
		}
		getTitleFontSize(): number | string {
			return this.titleFontSize
		}

		setHeight(height: number | string): Model {
			this.height = height
			return this
		}
		getHeight(): number | string {
			return this.height
		}

		setWidth(width: number | string): Model {
			this.width = width
			return this
		}
		getWidth(): number | string {
			return this.width
		}

		setFontSize(fontSize: number | string): Model {
			this.fontSize = fontSize
			return this
		}
		getFontSize(): number | string {
			return this.fontSize
		}

		setFontColor(fontColor: string | Color): Model {
			this.fontColor = fontColor
			return this
		}
		getFontColor(): string | Color {
			return this.fontColor
		}

		setBackgroundColor(backgroundColor: string | Color): Model {
			this.backgroundColor = backgroundColor
			return this
		}
		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setBorderWidth(borderWidth: number | string): Model {
			this.borderWidth = borderWidth
			return this
		}
		getBorderWidth(): number | string {
			return this.borderWidth
		}

		setBorderRadius(borderRadius: number | string): Model {
			this.borderRadius = borderRadius
			return this
		}
		getBorderRadius(): number | string {
			return this.borderRadius
		}

		setBorderColor(borderColor: string | Color): Model {
			this.borderColor = borderColor
			return this
		}
		getBorderColor(): string | Color {
			return this.borderColor
		}

		setUnselectedColor(unselectedColor: string | Color): Model {
			this.unselectedColor = unselectedColor
			return this
		}
		getUnselectedColor(): string | Color {
			return this.unselectedColor
		}

		setSelectedColor(selectedColor: string | Color): Model {
			this.selectedColor = selectedColor
			return this
		}
		getSelectedColor(): string | Color {
			return this.selectedColor
		}
	}

	export class MenuModel {
		private height: number | string = 40
		private width: number | string = 150
		private fontSize: number | string = 14
		private fontColor: string | Color = Color.Black
		private backgroundColor: string | Color = Color.White
		private borderRadius: number | string = 0

		setHeight(height: number | string): MenuModel {
			this.height = height
			return this
		}
		getHeight(): number | string {
			return this.height
		}

		setWidth(width: number | string): MenuModel {
			this.width = width
			return this
		}
		getWidth(): number | string {
			return this.width
		}

		setFontSize(fontSize: number | string): MenuModel {
			this.fontSize = fontSize
			return this
		}
		getFontSize(): number | string {
			return this.fontSize
		}

		setFontColor(fontColor: string | Color): MenuModel {
			this.fontColor = fontColor
			return this
		}
		getFontColor(): string | Color {
			return this.fontColor
		}

		setBackgroundColor(backgroundColor: string | Color): MenuModel {
			this.backgroundColor = backgroundColor
			return this
		}
		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setBorderRadius(borderRadius: number | string): MenuModel {
			this.borderRadius = borderRadius
			return this
		}
		getBorderRadius(): number | string {
			return this.borderRadius
		}
	}

	export class MultipleMenuModel extends MenuModel {
		private checkColor: string | Color = Color.Blue
		private checkBoxHeight: number | string = 24
		private checkBoxWidth: number | string = 24

		setCheckColor(checkColor: string | Color): MultipleMenuModel {
			this.checkColor = checkColor
			return this
		}
		getCheckColor(): string | Color {
			return this.checkColor
		}

		setCheckBoxHeight(checkBoxHeight: number | string): MultipleMenuModel {
			this.checkBoxHeight = checkBoxHeight
			return this
		}
		getCheckBoxHeight(): number | string {
			return this.checkBoxHeight
		}

		setCheckBoxWidth(checkBoxWidth: number | string): MultipleMenuModel {
			this.checkBoxHeight = checkBoxWidth
			return this
		}
		getCheckBoxWidth(): number | string {
			return this.checkBoxWidth
		}
	}

	export class DotModel {
		private height: number | string = 24
		private width: number | string = 24
		private backgroundColor: string | Color = Color.White
		private borderWidth: number | string = 1
		private borderRadius: number | string = 4
		private borderColor: string | Color = Color.Black

		setHeight(height: number | string): DotModel {
			this.height = height
			return this
		}
		getHeight(): number | string {
			return this.height
		}

		setWidth(width: number | string): DotModel {
			this.width = width
			return this
		}
		getWidth(): number | string {
			return this.width
		}

		setBackgroundColor(backgroundColor: string | Color): DotModel {
			this.backgroundColor = backgroundColor
			return this
		}
		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setBorderWidth(borderWidth: number | string): DotModel {
			this.borderWidth = borderWidth
			return this
		}
		getBorderWidth(): number | string {
			return this.borderWidth
		}

		setBorderRadius(borderRadius: number | string): DotModel {
			this.borderRadius = borderRadius
			return this
		}
		getBorderRadius(): number | string {
			return this.borderRadius
		}

		setBorderColor(borderColor: string | Color): DotModel {
			this.borderColor = borderColor
			return this
		}
		getBorderColor(): string | Color {
			return this.borderColor
		}
	}

	export class DotMenuModel extends MenuModel{
		private iconHeight: number | string = 18
		private iconWidth: number | string = 18

		setIconHeight(iconHeight: number | string): DotMenuModel {
			this.iconHeight = iconHeight
			return this
		}
		getIconHeight(): number | string {
			return this.iconHeight
		}

		setIconWidth(iconWidth: number | string): DotMenuModel {
			this.iconWidth = iconWidth
			return this
		}
		getIconWidth(): number | string {
			return this.iconWidth
		}
	}
}