import com.GameInterface.DistributedValue;

class com.judgy.npb.Mod {
	private var m_swfRoot:MovieClip; 
	
	private var windowDV:DistributedValue;
	
	public static function main(swfRoot:MovieClip) {
		var s_app = new Mod(swfRoot);
		
		swfRoot.onLoad = function() { s_app.Load(); };
		swfRoot.onUnload = function() { s_app.Unload(); };
	}
	
	public function Mod(swfRoot:MovieClip) {
		m_swfRoot = swfRoot;
    }
	
	public function Load():Void {
		windowDV = DistributedValue.Create("12MonthBundlePurchase_window");
		windowDV.SignalChanged.Connect(OnBundleWindowSlot, this);
		
		OnBundleWindowSlot();
	}
	
	public function OnUnload():Void {
		windowDV.SignalChanged.Disconnect(OnBundleWindowSlot, this);
	}
	
	public function OnBundleWindowSlot(dv:DistributedValue):Void {
		//com.GameInterface.UtilsBase.PrintChatText("OnBundleWindowSlot : " + windowDV.GetValue());
		if (windowDV.GetValue())
			windowDV.SetValue(false);
	}
}