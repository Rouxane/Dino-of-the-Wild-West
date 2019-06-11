// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Conifer_Needles_Dekstop_Spec("Conifer_Needles_Dekstop_Spec", 2D) = "white" {}
		_Conifer_Needles_Desktop("Conifer_Needles_Desktop", 2D) = "white" {}
		_Conifer_Needles_Desktop_Normal("Conifer_Needles_Desktop_Normal", 2D) = "bump" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Conifer_Needles_Desktop_Normal;
		uniform float4 _Conifer_Needles_Desktop_Normal_ST;
		uniform sampler2D _Conifer_Needles_Desktop;
		uniform float4 _Conifer_Needles_Desktop_ST;
		uniform sampler2D _Conifer_Needles_Dekstop_Spec;
		uniform float4 _Conifer_Needles_Dekstop_Spec_ST;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Conifer_Needles_Desktop_Normal = i.uv_texcoord * _Conifer_Needles_Desktop_Normal_ST.xy + _Conifer_Needles_Desktop_Normal_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Conifer_Needles_Desktop_Normal, uv_Conifer_Needles_Desktop_Normal ) );
			float2 uv_Conifer_Needles_Desktop = i.uv_texcoord * _Conifer_Needles_Desktop_ST.xy + _Conifer_Needles_Desktop_ST.zw;
			o.Albedo = tex2D( _Conifer_Needles_Desktop, uv_Conifer_Needles_Desktop ).rgb;
			o.Alpha = 1;
			float2 uv_Conifer_Needles_Dekstop_Spec = i.uv_texcoord * _Conifer_Needles_Dekstop_Spec_ST.xy + _Conifer_Needles_Dekstop_Spec_ST.zw;
			clip( tex2D( _Conifer_Needles_Dekstop_Spec, uv_Conifer_Needles_Dekstop_Spec ).r - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
93;118;1813;1004;906.5;500.5;1;True;True
Node;AmplifyShaderEditor.SamplerNode;2;-314.5,-248.5;Float;True;Property;_Conifer_Needles_Desktop;Conifer_Needles_Desktop;2;0;Create;True;0;0;False;0;1ef5fec63cb94a5439a94d43afba8d85;1ef5fec63cb94a5439a94d43afba8d85;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-389.5,14.5;Float;True;Property;_Conifer_Needles_Desktop_Normal;Conifer_Needles_Desktop_Normal;3;0;Create;True;0;0;False;0;4505324c950b41741954a13024ed4895;4505324c950b41741954a13024ed4895;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-417.5,283.5;Float;True;Property;_Conifer_Needles_Dekstop_Spec;Conifer_Needles_Dekstop_Spec;1;0;Create;True;0;0;False;0;05f12eb499acea740a9b573a5bdfdd61;05f12eb499acea740a9b573a5bdfdd61;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;0;0;2;0
WireConnection;0;1;3;0
WireConnection;0;10;1;0
ASEEND*/
//CHKSM=B7600EB496A8B3D9D8EB27F1E638929EE3FF23AC