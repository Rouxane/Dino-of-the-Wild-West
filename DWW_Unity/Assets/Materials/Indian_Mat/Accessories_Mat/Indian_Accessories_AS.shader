// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Accessories"
{
	Properties
	{
		_Accessories_Base_Color("Accessories_Base_Color", 2D) = "white" {}
		_Accessories_Mixed_AO("Accessories_Mixed_AO", 2D) = "white" {}
		_Accessories_Normal_DirectX("Accessories_Normal_DirectX", 2D) = "bump" {}
		_Accessories_Roughness("Accessories_Roughness", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Accessories_Normal_DirectX;
		uniform float4 _Accessories_Normal_DirectX_ST;
		uniform sampler2D _Accessories_Base_Color;
		uniform float4 _Accessories_Base_Color_ST;
		uniform sampler2D _Accessories_Roughness;
		uniform float4 _Accessories_Roughness_ST;
		uniform sampler2D _Accessories_Mixed_AO;
		uniform float4 _Accessories_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Accessories_Normal_DirectX = i.uv_texcoord * _Accessories_Normal_DirectX_ST.xy + _Accessories_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Accessories_Normal_DirectX, uv_Accessories_Normal_DirectX ) );
			float2 uv_Accessories_Base_Color = i.uv_texcoord * _Accessories_Base_Color_ST.xy + _Accessories_Base_Color_ST.zw;
			o.Albedo = tex2D( _Accessories_Base_Color, uv_Accessories_Base_Color ).rgb;
			float2 uv_Accessories_Roughness = i.uv_texcoord * _Accessories_Roughness_ST.xy + _Accessories_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _Accessories_Roughness, uv_Accessories_Roughness ) ).r;
			float2 uv_Accessories_Mixed_AO = i.uv_texcoord * _Accessories_Mixed_AO_ST.xy + _Accessories_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _Accessories_Mixed_AO, uv_Accessories_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
-1;32;1906;1004;953;497.5;1;True;False
Node;AmplifyShaderEditor.SamplerNode;4;-584,123.5;Float;True;Property;_Accessories_Roughness;Accessories_Roughness;3;0;Create;True;0;0;False;0;cd981def37515394fbe91365829a7154;cd981def37515394fbe91365829a7154;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-312,-279.5;Float;True;Property;_Accessories_Base_Color;Accessories_Base_Color;0;0;Create;True;0;0;False;0;3f01fe5ee2d15bd4bb2289f9d3feeea7;3f01fe5ee2d15bd4bb2289f9d3feeea7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-650,-129.5;Float;True;Property;_Accessories_Normal_DirectX;Accessories_Normal_DirectX;2;0;Create;True;0;0;False;0;2ffd7f28b0281a842aeceeea36e8be28;2ffd7f28b0281a842aeceeea36e8be28;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;5;-205,32.5;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;-225,189.5;Float;True;Property;_Accessories_Mixed_AO;Accessories_Mixed_AO;1;0;Create;True;0;0;False;0;55f9475c3ab2f7e4d81cabb6db5121a0;55f9475c3ab2f7e4d81cabb6db5121a0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;211,-53;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Accessories;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;4;0
WireConnection;0;0;1;0
WireConnection;0;1;3;0
WireConnection;0;4;5;0
WireConnection;0;5;2;0
ASEEND*/
//CHKSM=C7E5445D1D6C58E99B31ED30D28B6556EFF8BD5A