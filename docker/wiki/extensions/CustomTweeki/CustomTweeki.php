$wgResourceModules['x.CUSTOMTWEEKI.styles'] = array(
  'styles' => array(
		'screen.css' => array( 'media' => 'screen' )
	),
  'localBasePath' => __DIR__,
  'remoteExtPath' => 'CUSTOMTWEEKI',
);

$wgTweekiSkinCustomCSS[] = 'x.CUSTOMTWEEKI.styles';