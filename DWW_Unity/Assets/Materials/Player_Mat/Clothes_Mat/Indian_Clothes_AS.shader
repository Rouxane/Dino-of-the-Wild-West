// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "clothes"
{
	Properties
	{
		_Clothes_Base_Color("Clothes_Base_Color", 2D) = "white" {}
		_Clothes_Mixed_AO("Clothes_Mixed_AO", 2D) = "white" {}
		_Clothes_Normal_DirectX("Clothes_Normal_DirectX", 2D) = "bump" {}
		_Clothes_Roughness("Clothes_Roughness", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Clothes_Normal_DirectX;
		uniform float4 _Clothes_Normal_DirectX_ST;
		uniform sampler2D _Clothes_Base_Color;
		uniform float4 _Clothes_Base_Color_ST;
		uniform sampler2D _Clothes_Roughness;
		uniform float4 _Clothes_Roughness_ST;
		uniform sampler2D _Clothes_Mixed_AO;
		uniform float4 _Clothes_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Clothes_Normal_DirectX = i.uv_texcoord * _Clothes_Normal_DirectX_ST.xy + _Clothes_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Clothes_Normal_DirectX, uv_Clothes_Normal_DirectX ) );
			float2 uv_Clothes_Base_Color = i.uv_texcoord * _Clothes_Base_Color_ST.xy + _Clothes_Base_Color_ST.zw;
			o.Albedo = tex2D( _Clothes_Base_Color, uv_Clothes_Base_Color ).rgb;
			float2 uv_Clothes_Roughness = i.uv_texcoord * _Clothes_Roughness_ST.xy + _Clothes_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _Clothes_Roughness, uv_Clothes_Roughness ) ).r;
			float2 uv_Clothes_Mixed_AO = i.uv_texcoord * _Clothes_Mixed_AO_ST.xy + _Clothes_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _Clothes_Mixed_AO, uv_Clothes_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
7;7;1906;1004;953;497.5;1;True;False
Node;AmplifyShaderEditor.SamplerNode;5;-627,48.5;Float;True;Property;_Clothes_Roughness;Clothes_Roughness;3;0;Create;True;0;0;False;0;fb05319ce68906249bb1799c5a7e1207;fb05319ce68906249bb1799c5a7e1207;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;6;-210,26.5;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1;-463,-414.5;Float;True;Property;_Clothes_Base_Color;Clothes_Base_Color;0;0;Create;True;0;0;False;0;9fa4b8691f28c6c4c9c9bcad26e682f0;9fa4b8691f28c6c4c9c9bcad26e682f0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-487,-186.5;Float;True;Property;_Clothes_Normal_DirectX;Clothes_Normal_DirectX;2;0;Create;True;0;0;False;0;3b28e80ebf0ea534498ae855bcfc93e8;3b28e80ebf0ea534498ae855bcfc93e8;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-291,158.5;Float;True;Property;_Clothes_Mixed_AO;Clothes_Mixed_AO;1;0;Create;True;0;0;False;0;3b8879105c369eb489120e5c2c1b54bf;3b8879105c369eb489120e5c2c1b54bf;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;99,-92;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;clothes;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;5;0
WireConnection;0;0;1;0
WireConnection;0;1;4;0
WireConnection;0;4;6;0
WireConnection;0;5;3;0
ASEEND*/
//CHKSM=97743EDFBACD89CDBB606E79A788D5AC70187811