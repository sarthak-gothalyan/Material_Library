// make functions to change properties
export namespace MaterialModel {
	export class Model {
		title: string = ''
		titleFontSize: number | string = 14
		placeholder: string = 'Select'
		height: number | string = 60
		width: number | string = 100
		fontSize: number | string = 18
		fontColor: string | Color = '#333F48'
		backgroundColor: string | Color = Color.White
		borderWidth: number | string = 1
		borderRadius: number | string = 4
		borderColor: string | Color = '#9CA2C7'
		// add functionality for selection color
		unselectedColor: string | Color = Color.White
		selectedColor: string | Color = '#F0F3FF'

		constructor(ttle: string, phdr?: string) {
			this.title = ttle
			if(phdr != null) this.placeholder = phdr
		}

		getTitle(void): string {
			return this.title
		}

		setPlaceholder(phdr: string): Model {
			this.placeholder = phdr
			return this
		}
		getPlaceholder(void): string {
			return this.placeholder
		}

		setTitleFontSize(ttleFNTS: number | string): Model {
			this.titleFontSize = ttleFNTS
			return this
		}
		getTitleFontSize(): number | string {
			return this.titleFontSize
		}

		setHeight(ht: number | string): Model {
			this.height = ht
			return this
		}
		getHeight(): number | string {
			return this.height
		}

		setWidth(wt: number | string): Model {
			this.width = wt
			return this
		}
		getWidth(): number | string {
			return this.width
		}

		setFontSize(fntS: number | string): Model {
			this.fontSize = fntS
			return this
		}
		getFontSize(): number | string {
			return this.fontSize
		}

		setFontColor(fntC: string | Color): Model {
			this.fontColor = fntC
			return this
		}
		getFontColor(): string | Color {
			return this.fontColor
		}

		setBackgroundColor(bckgC: string | Color): Model {
			this.backgroundColor = bckgC
			return this
		}
		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setBorderWidth(brdW: number | string): Model {
			this.borderWidth = brdW
			return this
		}
		getBorderWidth(): number | string {
			return this.borderWidth
		}

		setBorderRadius(brdR: number | string): Model {
			this.borderRadius = brdR
			return this
		}
		getBorderRadius(): number | string {
			return this.borderRadius
		}

		setBorderColor(brdC: string | Color): Model {
			this.borderColor = brdc
			return this
		}
		getBorderColor(): string | Color {
			return this.borderColor
		}

		setUnselectedColor(UnselectedColor: string | Color): Model {
			this.unselectedColor = UnselectedColor
			return this
		}
		getUnselectedColor(): string | Color {
			return this.unselectedColor
		}

		setSelectedColor(slctC: string | Color): Model {
			this.selectedColor = slctC
			return this
		}
		getSelectedColor(): string | Color {
			return this.selectedColor
		}
	}

	export class MenuModel {
		height: number | string = 20
		width: number | string = 150
		fontSize: number | string = 14
		fontColor: string | Color = Color.Black
		backgroundColor: string | Color = Color.White
		borderRadius: number | string = 0
	}

	export class MultipleMenuModel extends MenuModel {
		selectedColor: string | Color = Color.Blue
		checkBoxHeight: number | string = 24
		checkBoxWidth: number | string = 24
	}

	export class DotModel {
		height: number | string = 24
		width: number | string = 24
		backgroundColor: string | Color = Color.White
		borderWidth: number | string = 1
		borderRadius: number | string = 4
		borderColor: string | Color = Color.Black
	}

	export class DotMenuModel extends MenuModel{
		iconHeight: number | string = 18
		iconWidth: number | string = 18

		setIconHeight(iconHeight: number | string): Model {
			this.iconHeight = iconHeight
			return this
		}
		getIconHeight(): number | string {
			return this.iconHeight
		}

		setIconHeight(iconWidth: number | string): Model {
			this.iconWidth = iconWidth
			return this
		}
		getIconWidth(): number | string {
			return this.iconWidth
		}
	}
}