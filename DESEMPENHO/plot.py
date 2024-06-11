# Extraido do plot.ipynb para execução no container

import json
import matplotlib.pyplot as plt

with open('DockerRun.json') as f:
    data = json.load(f)

executions = data['executions']
metrics = ['task_clock', 'cycles', 'stalled_cycles_frontend', 'instructions', 'branches', 'branch_misses', 'l1_dcache_loads', 'l1_dcache_load_misses']

metrics_data = {metric: [] for metric in metrics}
names = []
real_times = []
user_times = []
sys_times = []

for execution in executions:
    names.append(f"{execution['name']} {execution.get('input', '')}".strip())
    real_time_str = execution['real_time']
    user_time_str = execution['user_time']
    sys_time_str = execution['sys_time']
    real_times.append(float(real_time_str.split()[0]))
    user_times.append(float(user_time_str.split()[0]))
    sys_times.append(float(sys_time_str.split()[0]))
    for metric in metrics:
        value_str = execution['perf_output'][metric]
        value = float(value_str.split()[0].replace(',', ''))
        metrics_data[metric].append(value)

metric_translations = {
    'task_clock': 'Tempo de Tarefa',
    'cycles': 'Ciclos',
    'stalled_cycles_frontend': 'Ciclos Parados no Frontend',
    'instructions': 'Instruções',
    'branches': 'Ramificações',
    'branch_misses': 'Falhas de Ramificação',
    'l1_dcache_loads': 'Carregamentos L1 DCache',
    'l1_dcache_load_misses': 'Falhas de Carregamento L1 DCache'
}

factorial_indices = [i for i, name in enumerate(names) if 'fatorial' in name]
other_indices = [i for i, name in enumerate(names) if 'fatorial' not in name]

factorial_names = [names[i] for i in factorial_indices]
factorial_real_times = [real_times[i] for i in factorial_indices]
factorial_user_times = [user_times[i] for i in factorial_indices]
factorial_sys_times = [sys_times[i] for i in factorial_indices]

other_names = [names[i] for i in other_indices]
other_real_times = [real_times[i] for i in other_indices]
other_user_times = [user_times[i] for i in other_indices]
other_sys_times = [sys_times[i] for i in other_indices]

plt.figure(figsize=(10, 5))
plt.barh(factorial_names, factorial_real_times, color='lightcoral', label='Tempo Real')
plt.barh(factorial_names, factorial_user_times, color='skyblue', label='Tempo de Usuário', left=factorial_real_times)
plt.barh(factorial_names, factorial_sys_times, color='lightgreen', label='Tempo de Sistema', left=[r + u for r, u in zip(factorial_real_times, factorial_user_times)])
plt.xlabel('Tempo (segundos)')
plt.title('Comparação dos Tempos de Execução para Fatorial')
plt.legend()
plt.tight_layout()
plt.savefig('resultados/tempo_execucao_fatorial.png')
plt.close()

plt.figure(figsize=(10, 5))
plt.barh(other_names, other_real_times, color='lightcoral', label='Tempo Real')
plt.barh(other_names, other_user_times, color='skyblue', label='Tempo de Usuário', left=other_real_times)
plt.barh(other_names, other_sys_times, color='lightgreen', label='Tempo de Sistema', left=[r + u for r, u in zip(other_real_times, other_user_times)])
plt.xlabel('Tempo (segundos)')
plt.title('Comparação dos Tempos de Execução para Outras Funções')
plt.legend()
plt.tight_layout()
plt.savefig('resultados/tempo_execucao_outras.png')
plt.close()

for metric, values in metrics_data.items():
    plt.figure(figsize=(10, 5))
    plt.barh(names, values, color='skyblue')
    plt.xlabel(metric_translations[metric])
    plt.title(f'Comparação de {metric_translations[metric]} entre Execuções')
    plt.tight_layout()
    plt.savefig(f'resultados/{metric}.png')
    plt.close()
