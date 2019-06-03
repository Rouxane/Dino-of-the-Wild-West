// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "feather"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Feathers_Base_Color("Feathers_Base_Color", 2D) = "white" {}
		_Feathers_Roughness("Feathers_Roughness", 2D) = "white" {}
		_Feathers_Opacity("Feathers_Opacity", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Feathers_Base_Color;
		uniform float4 _Feathers_Base_Color_ST;
		uniform sampler2D _Feathers_Roughness;
		uniform float4 _Feathers_Roughness_ST;
		uniform sampler2D _Feathers_Opacity;
		uniform float4 _Feathers_Opacity_ST;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Feathers_Base_Color = i.uv_texcoord * _Feathers_Base_Color_ST.xy + _Feathers_Base_Color_ST.zw;
			o.Albedo = tex2D( _Feathers_Base_Color, uv_Feathers_Base_Color ).rgb;
			float2 uv_Feathers_Roughness = i.uv_texcoord * _Feathers_Roughness_ST.xy + _Feathers_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _Feathers_Roughness, uv_Feathers_Roughness ) ).r;
			o.Alpha = 1;
			float2 uv_Feathers_Opacity = i.uv_texcoord * _Feathers_Opacity_ST.xy + _Feathers_Opacity_ST.zw;
			clip( tex2D( _Feathers_Opacity, uv_Feathers_Opacity ).r - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
7;7;1906;1004;1321.856;434.8149;1.3;True;False
Node;AmplifyShaderEditor.SamplerNode;4;-793.8848,6.887424;Float;True;Property;_Feathers_Roughness;Feathers_Roughness;2;0;Create;True;0;0;False;0;a55a13f885f3e2a45bbb2b8bc161b907;a55a13f885f3e2a45bbb2b8bc161b907;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-629.582,-255.0899;Float;True;Property;_Feathers_Base_Color;Feathers_Base_Color;1;0;Create;True;0;0;False;0;0e25a3b8b16ecfe4eb8e27e0a405ae57;0e25a3b8b16ecfe4eb8e27e0a405ae57;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;6;-353.3553,59.18479;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;5;-517.6619,238.5593;Float;True;Property;_Feathers_Opacity;Feathers_Opacity;3;0;Create;True;0;0;False;0;dcb6629ec0c39934f888389d55be5eb2;dcb6629ec0c39934f888389d55be5eb2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;feather;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;4;0
WireConnection;0;0;1;0
WireConnection;0;4;6;0
WireConnection;0;10;5;0
ASEEND*/
//CHKSM=9ABE95179C484074B8F406C58F7F6DA1302C61A4