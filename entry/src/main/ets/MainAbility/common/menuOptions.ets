class MenuOption {
	private value: string
	private id: number | string

	constructor(value: string, id: number | string) {
		if (value == null || value == undefined) {
			value = ''
			console.error("null or undefined passed as value to MenuOption")
		}
		if (id == null || id == undefined) {
			id = -1
			console.error('null or undefined passed as id to MenuOption')
		}
		this.value = value
		this.id = id
	}

	setValue(value: string): MenuOption {
		if (value == null || value == undefined) {
			value = ''
			console.error('null or undefined passed as value to MenuOption')
		}
		this.value = value
		return this
	}

	getValue(): string {
		return this.value
	}

	setId(id: number | string): MenuOption {
		if (id == null || id == undefined) {
			id = -1
			console.error('null or undefined passed as id to MenuOption')
		}
		this.id = id
		return this
	}

	getId(): number | string {
		return this.value
	}
}

class MultipleMenuOption {
	private value: string
	private id: number | string
	private isChecked: boolean = false

	constructor(value: string, id: number | string, isChecked?: boolean) {
		if (value == null || value == undefined) {
			value = ''
			console.error("null or undefined passed as value to MultipleMenuOption")
		}
		if (id == null || id == undefined) {
			id = -1
			console.error('null or undefined passed as id to MultipleMenuOption')
		}
		this.value = value
		this.id = id
		if (isChecked != null && isChecked != undefined) this.isChecked = Boolean(isChecked)
	}

	setValue(value: string): MultipleMenuOption {
		if (value == null || value == undefined) {
			value = ''
			console.error('null or undefined passed as value to MultipleMenuOption')
		}
		this.value = value
		return this
	}

	getValue(): string {
		return this.value
	}

	setId(id: number | string): MultipleMenuOption {
		if (id == null || id == undefined) {
			id = -1
			console.error('null or undefined passed as id to MultipleMenuOption')
		}
		this.id = id
		return this
	}

	getId(): number | string {
		return this.value
	}

	setIsChecked(isChecked: boolean): MultipleMenuOption {
		if (isChecked == null && isChecked == undefined) {
			isChecked = false
			console.error("null passed as isChecked to MultipleMenuOption")
		}
		this.isChecked = Boolean(isChecked)
		return this
	}

	getIsChecked(): boolean {
		return this.isChecked
	}
}

class DotMenuOption {
	private value: string
	private id: number | string
	private icon?: string | Resource

	constructor(value: string, id: number | string, icon?: string | Resource) {
		if (value == null || value == undefined) {
			value = ''
			console.error("null or undefined passed as value to DotMenuOption")
		}
		if (id == null || id == undefined) {
			id = -1
			console.error('null or undefined passed as id to DotMenuOption')
		}
		this.value = value
		this.id = id
		if (icon != null && icon != undefined) this.icon = icon
	}

	setValue(value: string): DotMenuOption {
		if (value == null || value == undefined) {
			value = ''
			console.error('null or undefined passed as value to MultipleMenuOption')
		}
		this.value = value
		return this
	}

	getValue(): string {
		return this.value
	}

	setId(id: number | string): DotMenuOption {
		if (id == null || id == undefined) {
			id = -1
			console.error('null or undefined passed as id to MultipleMenuOption')
		}
		this.id = id
		return this
	}

	getId(): number | string {
		return this.value
	}

	setIcon(icon: string | Resource) {
		if (icon == null || icon == undefined) {
			icon = ''
			console.error('null or undefined passed as icon to DotMenuOption')
		}
		this.icon = icon
	}

	getIcon(): string | Resource {
		return this.icon
	}
}

export { MenuOption, MultipleMenuOption, DotMenuOption }