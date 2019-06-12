// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Broadleaves_Card_Desktop("Broadleaves_Card_Desktop", 2D) = "white" {}
		_Broadleaves_Card_Desktop_Normal("Broadleaves_Card_Desktop_Normal", 2D) = "bump" {}
		_Broadleaves_Card_Desktop_Spec("Broadleaves_Card_Desktop_Spec", 2D) = "white" {}
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

		uniform sampler2D _Broadleaves_Card_Desktop_Normal;
		uniform float4 _Broadleaves_Card_Desktop_Normal_ST;
		uniform sampler2D _Broadleaves_Card_Desktop;
		uniform float4 _Broadleaves_Card_Desktop_ST;
		uniform sampler2D _Broadleaves_Card_Desktop_Spec;
		uniform float4 _Broadleaves_Card_Desktop_Spec_ST;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Broadleaves_Card_Desktop_Normal = i.uv_texcoord * _Broadleaves_Card_Desktop_Normal_ST.xy + _Broadleaves_Card_Desktop_Normal_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Broadleaves_Card_Desktop_Normal, uv_Broadleaves_Card_Desktop_Normal ) );
			float2 uv_Broadleaves_Card_Desktop = i.uv_texcoord * _Broadleaves_Card_Desktop_ST.xy + _Broadleaves_Card_Desktop_ST.zw;
			o.Albedo = tex2D( _Broadleaves_Card_Desktop, uv_Broadleaves_Card_Desktop ).rgb;
			o.Alpha = 1;
			float2 uv_Broadleaves_Card_Desktop_Spec = i.uv_texcoord * _Broadleaves_Card_Desktop_Spec_ST.xy + _Broadleaves_Card_Desktop_Spec_ST.zw;
			clip( tex2D( _Broadleaves_Card_Desktop_Spec, uv_Broadleaves_Card_Desktop_Spec ).r - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
-18;79;1906;1004;953;500.5;1;True;True
Node;AmplifyShaderEditor.SamplerNode;1;-468,-461.5;Float;True;Property;_Broadleaves_Card_Desktop;Broadleaves_Card_Desktop;1;0;Create;True;0;0;False;0;ff0ca242ca64c184d868ec0aec2c2de4;ff0ca242ca64c184d868ec0aec2c2de4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-426,-57.5;Float;True;Property;_Broadleaves_Card_Desktop_Normal;Broadleaves_Card_Desktop_Normal;2;0;Create;True;0;0;False;0;df903daee9c1f3949a46137cbe5a7239;df903daee9c1f3949a46137cbe5a7239;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-412,172.5;Float;True;Property;_Broadleaves_Card_Desktop_Spec;Broadleaves_Card_Desktop_Spec;3;0;Create;True;0;0;False;0;a009f17e9ef9c2f459b20d95cf6aefb6;a009f17e9ef9c2f459b20d95cf6aefb6;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;0;0;1;0
WireConnection;0;1;2;0
WireConnection;0;10;3;0
ASEEND*/
//CHKSM=064A6F3F0754A1F41833DE1B47FDD0CF10341CC0