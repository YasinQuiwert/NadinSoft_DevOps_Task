# Nadin Soft – DevOps Practical Task

This repository contains a DevOps take-home assignment for Nadin Soft. It demonstrates proficiency in containerization, CI/CD with GitLab, service monitoring with Prometheus and Grafana, alerting via Alertmanager, network-level restrictions with iptables, and auto-recovery using Docker policies.

---

## 🚀 Project Setup

Ensure that Docker and Docker Compose are installed. Then, from the root of the project, run:

```bash
docker-compose up --build
```

Once running, the Flask web service will be available at:

```
http://localhost:5000
```

---

## ⚙️ GitLab CI/CD Pipeline

The project includes a `.gitlab-ci.yml` file defining a three-stage pipeline:

- **Build**: Build Docker image
- **Test**: Run connectivity tests
- **Deploy**: Deploy the service with Docker Compose

### ✅ Automatic Trigger
CI/CD is automatically triggered when changes are pushed to the repository:

```bash
git push origin main
```

### ▶️ Manual Trigger (Optional)

1. Go to **CI/CD > Pipelines** in GitLab
2. Click **Run Pipeline**
3. Select the desired branch and execute

---

## 📊 Monitoring and Alerting

The system is fully instrumented for observability with Prometheus, Grafana, and Alertmanager:

| Purpose                          | Port  | Tool           |
|----------------------------------|-------|----------------|
| Scrape Flask metrics             | 9090  | Prometheus     |
| Alert on service failure         | 9093  | Alertmanager   |
| Dashboard visualization          | 3000  | Grafana        |

### Configuration Files:

- **Prometheus targets**: `monitoring/prometheus.yml`
- **Alert rules**: `monitoring/alert.rules.yml`
- **Alertmanager routing**: `monitoring/alertmanager.yml`

### Access Interfaces:

- Prometheus: [http://localhost:9090](http://localhost:9090)
- Alertmanager: [http://localhost:9093](http://localhost:9093)
- Grafana: [http://localhost:3000](http://localhost:3000)

Grafana is pre-configured to connect to Prometheus.

---

## 🔐 Network Security with iptables

To restrict external access to the Flask service on port `5000`, run the following rule:

```bash
sudo iptables -A INPUT -p tcp --dport 5000 ! -s 127.0.0.1 -j DROP
```

The executable script `iptables_rules.sh` is included in the project root for convenience.

---

## 🔄 Failure Recovery (Auto-Restart)

The Flask container is configured to auto-restart using Docker's restart policy:

```yaml
restart: always
```

If the container crashes or is killed manually (e.g. via `docker kill`), Docker will automatically restart it.

Verify with:

```bash
docker ps
```

---

## 📸 Screenshots and Logs

All key outputs have been documented with screenshots:

- ✅ Docker Compose service startup
- ✅ CI/CD pipeline success
- ✅ Prometheus and Grafana dashboards
- ✅ Alertmanager notification on service failure
- ✅ Verified iptables rules
- ✅ Auto-restart behavior after container kill

---

**Prepared by:** Yasin Abbasi
