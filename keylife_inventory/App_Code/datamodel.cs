//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class color
{
    public string category { get; set; }

    public virtual color colors1 { get; set; }
    public virtual color color1 { get; set; }
}

public partial class edited_mat
{
    public int userID { get; set; }
    public string edit_time { get; set; }
    public Nullable<int> last_quan { get; set; }
    public Nullable<int> new_quan { get; set; }
    public int id { get; set; }
    public string new_place { get; set; }

    public virtual user user { get; set; }
}

public partial class material
{
    public int mat_id { get; set; }
    public Nullable<int> user_id { get; set; }
    public string place { get; set; }
    public string sub_place { get; set; }
    public Nullable<int> Quantity { get; set; }
    public string date_time { get; set; }
    public string sireal_num { get; set; }
    public string brand { get; set; }
    public string title_en { get; set; }
    public string category { get; set; }
    public string title_ar { get; set; }
    public string unit { get; set; }
    public string datasheet { get; set; }
    public string value { get; set; }
    public Nullable<int> least_vlu { get; set; }

    public virtual user user { get; set; }
}

public partial class user
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public user()
    {
        this.edited_mat = new HashSet<edited_mat>();
        this.materials = new HashSet<material>();
    }

    public int id { get; set; }
    public string user_name { get; set; }
    public string password { get; set; }
    public string name { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<edited_mat> edited_mat { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<material> materials { get; set; }
}
