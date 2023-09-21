/* <Textfield: "title">
    <Textfield: "notes">
    <Details_Widget> onPress => go to fill in details form> // Doesn't have to be exported to seperate widget
      <Date required>
      <Time?>
      <Location?>
      <Priority?> // Maybe add priority field?

    <Category?> // Maybe add option to add alarm to a category (medical, work, meeting, misc)
*/

class NewAlarm {
  final String title;
  final String? notes;
  final DateTime date;
  final DateTime time;

  const NewAlarm(this.title, this.date, this.time, [this.notes]);
}

