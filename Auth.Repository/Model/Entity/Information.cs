using System;
using System.ComponentModel.DataAnnotations;

namespace Auth.Repository.Model.Entity
{
	public partial class Information
	{
		[Key]
		public int InfoId { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
		public DateTime DueDate { get; set; }
		public string Status { get; set; }
	}
}
