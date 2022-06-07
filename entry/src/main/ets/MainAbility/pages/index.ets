import {MaterialSelect, MenuOption, MultipleMaterialSelect, MultipleMenuOption, MaterialDescription} from '../common/select'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State select_menu: MenuOption[] = [
    {
      value: 'Option 1',
      //icon: $r('app.media.icon')
    },
    {
      value: 'Option 2',
      icon: $r('app.media.icon')
    },
    {
      value: 'Option 3',
      //icon: $r('app.media.icon')
    }
  ]
  @State multiple_select_menu: MultipleMenuOption[] = [
    {
      value: 'Option 1',
      is_checked: true
    },
    {
      value: 'Option 2',
      is_checked: false
    },
    {
      value: 'Option 3',
      is_checked: true
    },
  ]
  desc: string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et pellentesque nisl. Nulla accumsan at leo vel finibus. Pellentesque dictum tempus tortor nec tempus. Proin tincidunt augue eros, eu tincidunt orci tempus posuere. Etiam suscipit ligula nec lacus maximus pellentesque. Aliquam blandit tincidunt justo, ac rhoncus nunc suscipit id. Duis sodales malesuada orci, id bibendum mauris ultricies eu. Etiam congue volutpat metus, eu volutpat tortor accumsan vitae. Nam blandit, turpis ut bibendum fermentum, ex arcu ultrices mi, suscipit dignissim ante mi vel purus. Nunc magna ipsum, sollicitudin et erat et, placerat finibus lorem. Integer nisl elit, interdum non maximus nec, luctus ut ligula. Vestibulum facilisis lorem varius, suscipit urna eget, convallis velit. Maecenas consectetur in arcu sit amet malesuada. Etiam gravida velit non accumsan finibus. Ut id lacus ultrices, lacinia quam ac, dapibus enim. Etiam sed velit vulputate, pellentesque urna et, sodales tortor."

  build() {
    Row() {
      Column() {
        MaterialSelect({menu: this.select_menu, placeholder: 'Select', height: 80, width: 130, background_color: Color.Pink})
        MultipleMaterialSelect({menu: $multiple_select_menu, placeholder: 'Select', height: 80, width: 130, background_color: Color.Pink})
        MaterialDescription({text: this.desc, placeholder: 'File', height: 80, width: 130})
        Button("Test").onClick(() => {
          for(let i = 0; i < this.multiple_select_menu.length; i++) {
            console.log("" + this.multiple_select_menu[i].is_checked)
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}