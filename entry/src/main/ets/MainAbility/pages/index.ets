import {MaterialSelect, MenuOption, MultipleMaterialSelect, MultipleMenuOption, MultipleMenuSelection, MaterialFileSelect} from '../common/select'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State select_menu: MenuOption[] = [
    {
      value: 'Option 1',
      id: 0,
      //icon: $r('app.media.icon')
    },
    {
      value: 'Option 2',
      id: 1,
    },
    {
      value: 'Option 3',
      id: 2,
      //icon: $r('app.media.icon')
    },
    {
      value: 'Option 3',
      id: 2,
      //icon: $r('app.media.icon')
    },
    {
      value: 'Option 3',
      id: 2,
      //icon: $r('app.media.icon')
    },
    {
      value: 'Option 3',
      id: 2,
      //icon: $r('app.media.icon')
    },
    {
      value: 'Option 3',
      id: 2,
      //icon: $r('app.media.icon')
    },
  ]
  @State selection: MenuOption = {value: "", id: -1}
  @State multiple_select_menu: MultipleMenuOption[] = [
    {
      value: 'Option 1',
      id: 0,
      is_checked: true
    },
    {
      value: 'Option 2',
      id: 1,
      is_checked: false
    },
    {
      value: 'Option 3',
      id: 2,
      is_checked: true
    },
    {
      value: 'Option 4',
      id: 3,
      is_checked: true
    },
    {
      value: 'Option 5',
      id: 4,
      is_checked: true
    },
    {
      value: 'Option 6',
      id: 2,
      is_checked: true
    },
    {
      value: 'Option 7',
      id: 2,
      is_checked: true
    },
    {
      value: 'Option 8',
      id: 2,
      is_checked: true
    },
  ]
  @State multiple_selection: MultipleMenuSelection[] = []
  desc: string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et pellentesque nisl. Nulla accumsan at leo vel finibus. Pellentesque dictum tempus tortor nec tempus. Proin tincidunt augue eros, eu tincidunt orci tempus posuere. Etiam suscipit ligula nec lacus maximus pellentesque. Aliquam blandit tincidunt justo, ac rhoncus nunc suscipit id. Duis sodales malesuada orci, id bibendum mauris ultricies eu. Etiam congue volutpat metus, eu volutpat tortor accumsan vitae. Nam blandit, turpis ut bibendum fermentum, ex arcu ultrices mi, suscipit dignissim ante mi vel purus. Nunc magna ipsum, sollicitudin et erat et, placerat finibus lorem. Integer nisl elit, interdum non maximus nec, luctus ut ligula. Vestibulum facilisis lorem varius, suscipit urna eget, convallis velit. Maecenas consectetur in arcu sit amet malesuada. Etiam gravida velit non accumsan finibus. Ut id lacus ultrices, lacinia quam ac, dapibus enim. Etiam sed velit vulputate, pellentesque urna et, sodales tortor."

  build() {
    Row() {
      Column({space: 10}) {
        MaterialSelect({
          menu: this.select_menu,
          selection: $selection,
          background_color: Color.Pink
        })
        MultipleMaterialSelect({
          menu: $multiple_select_menu,
          selection: $multiple_selection,
          background_color: Color.Pink
        })
        MaterialFileSelect({text: this.desc})
        Button("Test").onClick(() => {
          console.log("Select: " + this.selection.value + ", " + this.selection.id)
          this.multiple_selection.forEach((it, i) => {
            console.log("Multiple Select: " + it.value + ", " + it.id)
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}