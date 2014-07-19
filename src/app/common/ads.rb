# Module to create & handle views for Ads - primarily Admob for now

# TODO : currently the code is very HARD bound with the view of YoBitch app. Needs to be more abstract

java_import 'com.google.android.gms.ads.AdRequest'
java_import 'com.google.android.gms.ads.AdSize'
java_import 'com.google.android.gms.ads.AdView'
java_import 'android.widget.RelativeLayout'
java_import 'android.view.ViewGroup'


module Ads

  # Needs the context, the parentl layout (currently only supports RelativeLayout) and the Ad ID.
  def get_admob_ad_view(context, layout, ad_unit_id)
    # Create an ad.
    ad_view = AdView.new(context)
    ad_view.set_ad_size(AdSize::BANNER)
    ad_view.set_ad_unit_id(ad_unit_id)


    # Add the AdView to the view hierarchy. The view will have no size
    # until the ad is loaded.
    params = RelativeLayout::LayoutParams.new(ViewGroup::LayoutParams::MATCH_PARENT, 
                                              ViewGroup::LayoutParams::WRAP_CONTENT)
    params.add_rule(RelativeLayout::ALIGN_PARENT_BOTTOM, ad_view.get_id())
    ad_view.set_layout_params(params)
    layout.add_view(ad_view)

    # Create an ad request. Check logcat output for the hashed device ID to
    # get test ads on a physical device.
    ad_request = AdRequest::Builder.new()
        .add_test_device(AdRequest::DEVICE_ID_EMULATOR)
        .build()

    # Start loading the ad in the background.
    ad_view.load_ad(ad_request)
  end

end