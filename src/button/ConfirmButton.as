package button
{
	import assets.Confirm;

	public class ConfirmButton extends Button
	{
		private var confirm:Confirm;
		public function ConfirmButton()
		{
			confirm = new Confirm;
			super(confirm);
			this.addChild(confirm);
		}
	}
}