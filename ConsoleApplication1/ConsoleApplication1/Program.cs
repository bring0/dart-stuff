using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    public enum InstrumentType
    {
        Guitar,
        Bass
    }


    public abstract class BaseInstrument
    {
        public abstract InstrumentType Type { get; }
        static string[][] Fretboard { get; set; }


    }
    

    public struct XyCoordinates
    {
        int X;
        int Y;
    }

    public class Bass : BaseInstrument
    {

        public static string[][] Fretboard { get; private set; }

        public Bass()
        {
            Fretboard = new string[3][];
            Fretboard[0][0] = "G";
            Fretboard[0][1] = "D";
            Fretboard[0][2] = "A";
            Fretboard[0][3] = "E";

            Fretboard[1][0] = "G#";
            Fretboard[1][1] = "D#";
            Fretboard[1][2] = "A#";
            Fretboard[1][3] = "F";

            Fretboard[2][0] = "A";
            Fretboard[2][1] = "E";
            Fretboard[2][2] = "B";
            Fretboard[2][3] = "F#";
        }


        public override InstrumentType Type
        {
            get { return InstrumentType.Bass; }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
        }
    }
}
