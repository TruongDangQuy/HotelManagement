using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelManager.DTO
{
    public class RoomType
    {
        private int id;
        private string name;
        private int price;
        private int limitPerson;
        private int bed;
        public RoomType() { }
        public RoomType(int id, string name, int price, int limitPerson, int bed)
        {
            this.Id = id;
            this.Name = name;
            this.Price = price;
            this.LimitPerson = limitPerson;
            this.Bed = bed;
        }
        public RoomType(DataRow row)
        {
            this.Id = (int)row["id"];
            this.Name = row["name"].ToString();
            this.Price = (int)row["price"];
            this.LimitPerson= (int)row["limitPerson"];
            this.Bed = (int)row["bed"];
        }
        public bool Equals(RoomType roomTypePre)
        {
            if (roomTypePre == null) return false;
            if (this.name != roomTypePre.name) return false;
            if (this.price != roomTypePre.price) return false;
            if (this.limitPerson != roomTypePre.limitPerson) return false;
            if(this.bed != roomTypePre.bed) return false;
            return true;
        }
        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public int Price { get => price; set => price = value; }
        public int LimitPerson { get => limitPerson; set => limitPerson = value; }
        public int Bed { get => bed; set => bed = value; }
    }
}
