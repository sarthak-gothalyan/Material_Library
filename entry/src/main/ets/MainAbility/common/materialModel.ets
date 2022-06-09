export namespace MaterialModel {
	export class Model {
		height: number | string
		width: number | string
		fontSize: number | string
		fontColor: string | Color
		backgroundColor: string | Color
		borderWidth: number | string
		borderRadius: number | string
		borderColor: string | Color
	}

	export class MenuModel {
		width: number | string
		fontSize: number | string
		fontColor: string | Color
		backgroundColor: string | Color
		borderRadius: number | string
	}

	export class MultipleMenuModel extends MenuModel {
		selectedColor: string | Color
		checkBoxHeight: number | string
		checkBoxWidth: number | string
	}

	export class DotMenuModel {
		height: number | string
		width: number | string
		menuWidth: number | string
		fontSize: number | string
		fontColor: string | Color
		iconHeight: string | Color
		iconWidth: string | Color
	}
}