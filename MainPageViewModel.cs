using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Collections.ObjectModel;
using Xamarin.Forms;

namespace App3
{
    public class MainPageViewModel : INotifyPropertyChanged
    {
        public MainPageViewModel()
        {
            EraseCommand = new Command(() =>
            {
                userNickname = string.Empty;
            });

            SaveCommand = new Command(() =>
            {
                AllNickname.Add(userNickname);

                userNickname = string.Empty;


            });
        }

        public ObservableCollection<string> AllNickname { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;

        string userNickname;

        public string userNickname
        {
            get => userNickname;
            set
            {
                userNickname = value;

                var args = new PropertyChangedEventArgs(nameof(userNickname));

                PropertyChanged?.Invoke(this, args);
            }

        }

        public Command SaveCommand { get; }
        public Command EraseCommand { get; }
    }
}
