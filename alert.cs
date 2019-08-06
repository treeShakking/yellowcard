using System;
using System.ComponentModel;

namespace DataService
{
   
    public class AlarmItem : IComparable<AlarmItem>, INotifyPropertyChanged
    {
        int _condiId;
       
        Severity _severity;
        SubAlarmType _alarmType;
        DateTime _startTime;
        TimeSpan _duration;       
        object _alarmValue;
        string _alarmText;
        string _source;

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(string propertyName)
        {
            if (this.PropertyChanged != null)
            {

                this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }

    }

}
