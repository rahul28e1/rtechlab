with open('DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/master_book_en.typ', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace('client_server_architecture.png", width: 92%)', 'client_server_architecture.png", width: 75%)')
text = text.replace('types_of_servers_infographic.png", width: 92%)', 'types_of_servers_infographic.png", width: 75%)')
text = text.replace('physical_virtual_cloud_comparison.png", width: 92%)', 'physical_virtual_cloud_comparison.png", width: 75%)')
text = text.replace('server_evolution_timeline.png", width: 92%)', 'server_evolution_timeline.png", width: 75%)')
text = text.replace('windows_client_vs_server_architecture.png", width: 92%)', 'windows_client_vs_server_architecture.png", width: 75%)')

with open('DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/master_book_en.typ', 'w', encoding='utf-8') as f:
    f.write(text)

print('Tuned images successfully!')
