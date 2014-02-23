package button
{
	import assets.Forbidden;

	public class CancelButton extends Button
	{
		private var cancel:Forbidden;
		public function CancelButton()
		{
			cancel = new Forbidden;
			super(cancel);
			this.addChild(cancel);
		}
	}
}