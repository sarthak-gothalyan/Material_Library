class MenuOption {
	private value: string
	private id: number | string

	constructor(value: string, id: number | string) {
		if (value == null || value == undefined) {
			value = ''
		}
		if (id == null || id == undefined) {
			id = -1
		}
		this.value = value
		this.id = id
	}

	setValue(value: string): MenuOption {
		if (value == null || value == undefined) {
			value = ''
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
	private checked: boolean = false

	constructor(value: string, id: number | string, checked?: boolean) {
		if (value == null || value == undefined) {
			value = ''
		}
		if (id == null || id == undefined) {
			id = -1
		}
		this.value = value
		this.id = id
		if (checked != null && checked != undefined) this.checked = Boolean(checked)
	}

	setValue(value: string): MultipleMenuOption {
		if (value == null || value == undefined) {
			value = ''
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
		}
		this.id = id
		return this
	}

	getId(): number | string {
		return this.value
	}

	setChecked(checked: boolean): MultipleMenuOption {
		if (checked == null && checked == undefined) {
			checked = false
		}
		this.checked = Boolean(checked)
		return this
	}

	getChecked(): boolean {
		return this.checked
	}
}

class DotMenuOption {
	private value: string
	private id: number | string
	private icon?: string | Resource

	constructor(value: string, id: number | string, icon?: string | Resource) {
		if (value == null || value == undefined) {
			value = ''
		}
		if (id == null || id == undefined) {
			id = -1
		}
		this.value = value
		this.id = id
		if (icon != null && icon != undefined) this.icon = icon
	}

	setValue(value: string): DotMenuOption {
		if (value == null || value == undefined) {
			value = ''
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
		}
		this.icon = icon
	}

	getIcon(): string | Resource {
		return this.icon
	}
}

export { MenuOption, MultipleMenuOption, DotMenuOption }