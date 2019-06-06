// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_TotemSG_Base_Color("TotemSG_Base_Color", 2D) = "white" {}
		_TotemSG_Mixed_AO("TotemSG_Mixed_AO", 2D) = "white" {}
		_TotemSG_Normal_DirectX("TotemSG_Normal_DirectX", 2D) = "bump" {}
		_TotemSG_Roughness("TotemSG_Roughness", 2D) = "white" {}
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

		uniform sampler2D _TotemSG_Normal_DirectX;
		uniform float4 _TotemSG_Normal_DirectX_ST;
		uniform sampler2D _TotemSG_Base_Color;
		uniform float4 _TotemSG_Base_Color_ST;
		uniform sampler2D _TotemSG_Roughness;
		uniform float4 _TotemSG_Roughness_ST;
		uniform sampler2D _TotemSG_Mixed_AO;
		uniform float4 _TotemSG_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TotemSG_Normal_DirectX = i.uv_texcoord * _TotemSG_Normal_DirectX_ST.xy + _TotemSG_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _TotemSG_Normal_DirectX, uv_TotemSG_Normal_DirectX ) );
			float2 uv_TotemSG_Base_Color = i.uv_texcoord * _TotemSG_Base_Color_ST.xy + _TotemSG_Base_Color_ST.zw;
			o.Albedo = tex2D( _TotemSG_Base_Color, uv_TotemSG_Base_Color ).rgb;
			float2 uv_TotemSG_Roughness = i.uv_texcoord * _TotemSG_Roughness_ST.xy + _TotemSG_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _TotemSG_Roughness, uv_TotemSG_Roughness ) ).r;
			float2 uv_TotemSG_Mixed_AO = i.uv_texcoord * _TotemSG_Mixed_AO_ST.xy + _TotemSG_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _TotemSG_Mixed_AO, uv_TotemSG_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
15;14;1906;1004;954;500.5;1;True;False
Node;AmplifyShaderEditor.SamplerNode;4;-328,18.5;Float;True;Property;_TotemSG_Roughness;TotemSG_Roughness;3;0;Create;True;0;0;False;0;1897883a2b8a94a4cb50d3dbef5091b9;1897883a2b8a94a4cb50d3dbef5091b9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-425,-212.5;Float;True;Property;_TotemSG_Normal_DirectX;TotemSG_Normal_DirectX;2;0;Create;True;0;0;False;0;206fe86bb360e664086f5f0f134234fa;206fe86bb360e664086f5f0f134234fa;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;5;118,30.5;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;-126,258.5;Float;True;Property;_TotemSG_Mixed_AO;TotemSG_Mixed_AO;1;0;Create;True;0;0;False;0;b649e69462d9a02418bdc99b2aa4294a;b649e69462d9a02418bdc99b2aa4294a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-66,-402.5;Float;True;Property;_TotemSG_Base_Color;TotemSG_Base_Color;0;0;Create;True;0;0;False;0;38094c43fbc415d499ec8c694b5b9261;38094c43fbc415d499ec8c694b5b9261;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;469,-54;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;4;0
WireConnection;0;0;1;0
WireConnection;0;1;3;0
WireConnection;0;4;5;0
WireConnection;0;5;2;0
ASEEND*/
//CHKSM=7C881353BA868405B1F3269D5178F8CEA7D28BD7